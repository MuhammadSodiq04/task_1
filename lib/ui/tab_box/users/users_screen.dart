import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/users/users_bloc.dart';
import 'package:task_1/data/models/user/user_model.dart';
import 'package:task_1/data/models/users/users_model.dart';
import 'package:task_1/ui/auth/auth_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Users screen"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const AuthScreen();
            }));
          }, icon: const Icon(Icons.login))
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is ErrorUsers) {
            return Center(child: Text(state.errorText));
          }
          if (state is SuccessUsers) {
            return ListView(
              children: [
                state.localUsers.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Local users", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),),
                      ),
                        ...List.generate(state.localUsers.length, (index) {
                          UserModel user = state.localUsers[index];
                          return ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.email),
                            trailing: Text(index.toString()),
                          );
                        })
                      ])
                    : const SizedBox(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Network users", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),),
                ),
                ...List.generate(state.users.length, (index) {
                  UsersModel user = state.users[index];
                  return ListTile(
                    onTap: () async {
                      final query =
                          '${user.address.lng},${user.address.lng}(${user.address.city})';
                      await launchUrl(Uri(
                          scheme: "geo",
                          host: "0,0",
                          queryParameters: {'q': query}));
                    },
                    title: Text(user.name),
                    subtitle: Text(user.phone),
                    trailing: Text(user.id.toString()),
                  );
                })
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

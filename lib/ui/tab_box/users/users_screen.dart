import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/users/users_bloc.dart';
import 'package:task_1/data/models/users/users_model.dart';
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
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if(state is ErrorUsers){
            return Center(child: Text(state.errorText));
          }
          if(state is SuccessUsers) {
            return ListView(
              children: [
                ...List.generate(state.users.length, (index) {
                  UsersModel user = state.users[index];
                  return ListTile(
                    onTap: ()async{
                      final query = '${user.address.lng},${user.address.lng}(${user.address.city})';
                      await launchUrl(Uri(scheme: "geo",host: "0,0",queryParameters: {'q': query}));
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/cubits/auth_cubit/auth_cubit.dart';
import 'package:task_1/data/local/hive_servise.dart';
import 'package:task_1/data/models/user/user_model.dart';
import 'package:task_1/ui/tab_box/tab_box.dart';
import 'package:task_1/ui/widgets/global_button.dart';
import 'package:task_1/ui/widgets/global_input.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalTextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller: state.nameController,
                  onChanged: (name) {
                    context.read<AuthCubit>().updateName(name);
                  },
                  focusNode: state.nameFocusNode,
                  hintText: 'Name',
                  prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.person,
                        color: state.nameColor,
                      )),
                ),
                const SizedBox(height: 20),
                GlobalTextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller: state.lastnameController,
                  onChanged: (lastname) {
                    context.read<AuthCubit>().updateLastname(lastname);
                  },
                  focusNode: state.lastnameFocusNode,
                  hintText: 'Lastname',
                  prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.person,
                        color: state.lastnameColor,
                      )),
                ),
                const SizedBox(height: 20),
                GlobalTextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  controller: state.emailController,
                  onChanged: (email) {
                    context.read<AuthCubit>().updateEmail(email);
                  },
                  focusNode: state.emailFocusNode,
                  hintText: 'Email',
                  prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.mail,
                        color: state.emailColor,
                      )),
                ),
                const SizedBox(height: 20),
                GlobalButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    title: "Continue",
                    onTap: () async {
                      if (state.nameController.text.isNotEmpty &&
                          state.lastnameController.text.isNotEmpty &&
                          state.emailController.text.isNotEmpty) {
                        await HiveService.addUser(UserModel(
                            name: state.nameController.text,
                            lastname: state.lastnameController.text,
                            email: state.emailController.text));
                        if (context.mounted) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const TabBox();
                          }));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Fields not full",
                            style: TextStyle(color: Colors.black),
                          ),
                        ));
                      }
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}

part of 'auth_cubit.dart';

class AuthState {
  final TextEditingController nameController;
  final TextEditingController lastnameController;
  final TextEditingController emailController;
  final FocusNode nameFocusNode;
  final FocusNode lastnameFocusNode;
  final FocusNode emailFocusNode;
  final Color nameColor;
  final Color lastnameColor;
  final Color emailColor;

  AuthState({
    required this.nameController,
    required this.lastnameController,
    required this.emailController,
    required this.nameFocusNode,
    required this.lastnameFocusNode,
    required this.emailFocusNode,
    required this.nameColor,
    required this.lastnameColor,
    required this.emailColor,
  });

  AuthState copyWith({
    TextEditingController? nameController,
    TextEditingController? lastnameController,
    TextEditingController? emailController,
    FocusNode? nameFocusNode,
    FocusNode? lastnameFocusNode,
    FocusNode? emailFocusNode,
    Color? nameColor,
    Color? lastnameColor,
    Color? emailColor,
  }) {
    return AuthState(
      nameController: nameController ?? this.nameController,
      lastnameColor: lastnameColor ?? this.lastnameColor,
      emailController: emailController ?? this.emailController,
      nameFocusNode: nameFocusNode ?? this.nameFocusNode,
      lastnameFocusNode: lastnameFocusNode ?? this.lastnameFocusNode,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      nameColor: nameColor ?? this.nameColor,
      lastnameController: lastnameController ?? this.lastnameController,
      emailColor: emailColor ?? this.emailColor,
    );
  }
}

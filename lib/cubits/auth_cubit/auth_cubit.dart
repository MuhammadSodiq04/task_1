import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/utils/colors/app_colors.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
    nameController: TextEditingController(),
    lastnameController: TextEditingController(),
    emailController: TextEditingController(),
    nameFocusNode: FocusNode(),
    lastnameFocusNode: FocusNode(),
    emailFocusNode: FocusNode(),
    nameColor: AppColors.c_500,
    lastnameColor: AppColors.c_500,
    emailColor: AppColors.c_500,
  )) {
    state.nameFocusNode.addListener(nameFocusChanged);
    state.lastnameFocusNode.addListener(lastnameFocusChanged);
    state.emailFocusNode.addListener(emailFocusChanged);
  }

  void updateEmail(String email) {
    Color newIconColor = email.isNotEmpty
        ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(emailController: state.emailController..text = email, emailColor: newIconColor));
  }

  void updateName(String name) {
    Color newIconColor2 = name.isNotEmpty
        ? (state.nameFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.nameFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(nameController: state.nameController..text = name, nameColor: newIconColor2));
  }

  void updateLastname(String lastname) {
    Color newIconColor2 = lastname.isNotEmpty
        ? (state.lastnameFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.lastnameFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(lastnameController: state.lastnameController..text = lastname, lastnameColor: newIconColor2));
  }

  void emailFocusChanged() {
    Color newIconColor =
    state.emailController.text.isNotEmpty ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(emailColor: newIconColor));
  }

  void nameFocusChanged() {
    Color newIconColor2 =
    state.nameController.text.isNotEmpty ? (state.nameFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.nameFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(nameColor: newIconColor2));
  }

  void lastnameFocusChanged() {
    Color newIconColor2 =
    state.lastnameController.text.isNotEmpty ? (state.lastnameFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.lastnameFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(lastnameColor: newIconColor2));
  }

  @override
  Future<void> close() {
    state.emailFocusNode.dispose();
    state.nameFocusNode.dispose();
    state.lastnameFocusNode.dispose();
    state.emailController.dispose();
    state.nameController.dispose();
    state.lastnameController.dispose();
    return super.close();
  }
}


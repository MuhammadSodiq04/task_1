part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class LoadingUsers extends UsersState {}

class SuccessUsers extends UsersState {
  SuccessUsers({required this.users,required this.localUsers});

  final List<UsersModel> users;
  final List<UserModel> localUsers;
}

class ErrorUsers extends UsersState {
  ErrorUsers({required this.errorText});

  final String errorText;
}

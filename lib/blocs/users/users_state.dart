part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}
class LoadingUsers extends UsersState {}
class SuccessUsers extends UsersState {
  SuccessUsers({required this.users});
  final List<UsersModel> users;
}
class ErrorUsers extends UsersState {
  ErrorUsers({required this.errorText});
  final String errorText;
}

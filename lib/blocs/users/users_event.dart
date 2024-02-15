part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}
class GetUsers extends UsersEvent{}
class GetLocalUsers extends UsersEvent{}

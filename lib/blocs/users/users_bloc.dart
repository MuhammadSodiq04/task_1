import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/data/local/hive_servise.dart';
import 'package:task_1/data/models/universal_data.dart';
import 'package:task_1/data/models/user/user_model.dart';
import 'package:task_1/data/models/users/users_model.dart';
import 'package:task_1/data/network/api_repository.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.apiRepository}) : super(UsersInitial()) {
    on<GetUsers>(_getUsers);
  }

  final CurrencyRepository apiRepository;

  Future<void> _getUsers(
    GetUsers event,
    Emitter<UsersState> emit,
  ) async {
    emit(LoadingUsers());
    List<UserModel> localUsers = await HiveService.getAllUsers();
    UniversalData response = await apiRepository.fetchUsers();
    if (response.error.isEmpty) {
      emit(SuccessUsers(users: response.data, localUsers: localUsers));
    } else {
      emit(ErrorUsers(errorText: "Error"));
    }
  }
}

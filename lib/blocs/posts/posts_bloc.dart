import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/data/models/posts/posts_model.dart';
import 'package:task_1/data/models/universal_data.dart';
import 'package:task_1/data/network/api_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.apiRepository}) : super(PostsInitial()) {
    on<GetPosts>(_getPosts);
  }

  final CurrencyRepository apiRepository;

  Future<void> _getPosts(
      GetPosts event,
      Emitter<PostsState> emit,
      ) async {
    emit(LoadingPosts());
    UniversalData response = await apiRepository.fetchCurrencies();
    if(response.error.isEmpty) {
      emit(SuccessPosts(posts: response.data));
    }else{
      emit(ErrorPosts(errorText: "Error"));
    }
  }
}

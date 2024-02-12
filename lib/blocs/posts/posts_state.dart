part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class LoadingPosts extends PostsState {}
class SuccessPosts extends PostsState {
  SuccessPosts({required this.posts});
  final List<PostsModel> posts;
}
class ErrorPosts extends PostsState {
  ErrorPosts({required this.errorText});
  final String errorText;
}

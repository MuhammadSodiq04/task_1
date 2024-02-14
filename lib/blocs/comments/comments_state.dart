part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}
class LoadingComments extends CommentsState {}
class SuccessComments extends CommentsState {
  SuccessComments({required this.comments});
  final List<CommentsModel> comments;
}
class ErrorComments extends CommentsState {
  ErrorComments({required this.errorText});
  final String errorText;
}

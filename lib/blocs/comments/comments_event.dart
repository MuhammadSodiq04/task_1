part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetComments extends CommentsEvent {}
class FetchComments extends CommentsEvent {}

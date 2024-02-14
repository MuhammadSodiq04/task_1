part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}
class GetPhotos extends PhotosEvent{}
class FetchPhotos extends PhotosEvent{}

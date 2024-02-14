part of 'photos_bloc.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}
class LoadingPhotos extends PhotosState {}
class SuccessPhotos extends PhotosState {
  SuccessPhotos({required this.photos});
  final List<PhotosModel> photos;
}
class ErrorPhotos extends PhotosState {
  ErrorPhotos({required this.errorText});
  final String errorText;
}

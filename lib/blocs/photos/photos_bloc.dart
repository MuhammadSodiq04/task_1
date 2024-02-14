import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/data/models/photos/photos_model.dart';
import 'package:task_1/data/models/universal_data.dart';
import 'package:task_1/data/network/api_repository.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc({required this.apiRepository}) : super(PhotosInitial()) {
    on<GetPhotos>(_getPhotos);
    on<FetchPhotos>(fetchPhotos);
  }

  final CurrencyRepository apiRepository;

  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  int countOfPage = 10;
  bool isLoading = true;
  List<PhotosModel> oldPhotos = [];

  Future<void> fetchPhotos(
      FetchPhotos event,
      Emitter<PhotosState> emit,
      ) async {
    currentPage+=1;
    UniversalData universalData = await apiRepository.fetchPhotos(
      page: currentPage,
      count: countOfPage,
    );

    if (universalData.error.isEmpty) {
      List<PhotosModel> photosModel =
      universalData.data as List<PhotosModel>;
      oldPhotos.addAll(photosModel);
    }
    emit(SuccessPhotos(photos: oldPhotos));
  }

  Future<void> _getPhotos(
      GetPhotos event,
      Emitter<PhotosState> emit,
      ) async {
    emit(LoadingPhotos());
    UniversalData response = await apiRepository.fetchPhotos(page: currentPage,count: countOfPage);
    if(response.error.isEmpty) {
      List<PhotosModel> photosModel =
      response.data as List<PhotosModel>;
      oldPhotos.addAll(photosModel);
      emit(SuccessPhotos(photos: oldPhotos));
    }else{
      emit(ErrorPhotos(errorText: "Error"));
    }
  }
}

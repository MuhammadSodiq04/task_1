import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/data/models/comments/comments_model.dart';
import 'package:task_1/data/models/universal_data.dart';
import 'package:task_1/data/network/api_repository.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.apiRepository}) : super(CommentsInitial()) {
    on<GetComments>(_getComments);
    on<FetchComments>(fetchComments);
  }

  final CurrencyRepository apiRepository;

  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  int countOfPage = 10;
  bool isLoading = true;
  List<CommentsModel> oldComments = [];

  Future<void> fetchComments(
      FetchComments event,
      Emitter<CommentsState> emit,
      ) async {
    currentPage+=1;
    UniversalData universalData = await apiRepository.fetchComments(
      page: currentPage,
      count: countOfPage,
    );

    if (universalData.error.isEmpty) {
      List<CommentsModel> commentsModel =
      universalData.data as List<CommentsModel>;
      oldComments.addAll(commentsModel);
    }
    emit(SuccessComments(comments: oldComments));
  }

  Future<void> _getComments(
      GetComments event,
      Emitter<CommentsState> emit,
      ) async {
    emit(LoadingComments());
    UniversalData response = await apiRepository.fetchComments(page: currentPage,count: countOfPage);
    if(response.error.isEmpty) {
      List<CommentsModel> commentsModel =
      response.data as List<CommentsModel>;
      oldComments.addAll(commentsModel);
      emit(SuccessComments(comments: oldComments));
    }else{
      emit(ErrorComments(errorText: response.error));
    }
  }
}

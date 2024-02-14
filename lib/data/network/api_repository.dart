import 'package:task_1/data/models/universal_data.dart';
import 'api_provider.dart';

class CurrencyRepository {
  final ApiProvider apiProvider;
  CurrencyRepository({required this.apiProvider});

  Future<UniversalData>fetchPosts()async => await apiProvider.getAllPosts();
  Future<UniversalData>fetchPhotos({required int page,required int count})async => await apiProvider.getAllPhotos(page: page,count: count);
  Future<UniversalData>fetchComments({required int page,required int count})async => await apiProvider.getAllComments(page: page,count: count);
  Future<UniversalData>fetchUsers()async => await apiProvider.getAllUsers();
}
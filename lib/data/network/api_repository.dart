import 'package:task_1/data/models/universal_data.dart';
import 'api_provider.dart';

class CurrencyRepository {
  final ApiProvider apiProvider;
  CurrencyRepository({required this.apiProvider});

  Future<UniversalData>fetchCurrencies()async => await apiProvider.getAllCurrencies();
}
import 'package:blott_mobile_assesment/src/data/datasource/base/base_api_repositories.dart';
import 'package:blott_mobile_assesment/src/data/datasource/remote/api_services.dart';
import 'package:blott_mobile_assesment/src/data/model/news_model.dart';
import 'package:blott_mobile_assesment/src/data/resources/data_state.dart';
import 'package:blott_mobile_assesment/src/domain/repositories/api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final ApiService _apiService;
  ApiRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<NewsModel>>> getNews(
      String category, String token) async {
    return await getStateOf<List<NewsModel>>(
      request: () => _apiService.getNews(category, token),
    );
  }
}

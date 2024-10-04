import 'package:blott_mobile_assesment/src/data/model/news_model.dart';
import 'package:blott_mobile_assesment/src/data/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<List<NewsModel>>> getNews(
    String category,
    String token,
  );
}

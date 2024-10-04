import 'package:blott_mobile_assesment/src/data/model/news_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(
  baseUrl: 'https://finnhub.io/api/v1',
  parser: Parser.MapSerializable,
)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/news')
  Future<HttpResponse<List<NewsModel>>> getNews(
    @Query('category') String category,
    @Query('token') String token,
  );
}

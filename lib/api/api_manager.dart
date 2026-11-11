import 'package:dio/dio.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';

class ApiManager {
  final dio = Dio();

  final String apikey = '3c2aecc91f314b8c8c15674eafe01803';

  ApiManager() {
    dio.options = BaseOptions(
      baseUrl: 'https://newsapi.org',
      receiveTimeout: Duration(seconds: 180),
      sendTimeout: Duration(seconds: 180),
      connectTimeout: Duration(seconds: 180),
      headers: {"Authorization": "3c2aecc91f314b8c8c15674eafe01803"},
    );
  }

  Future<SourcesResponse> getSources(String category) async {
    Response response = await dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {"category": category},
    );
    return SourcesResponse.fromJson(response.data);
  }

  Future<ArticlesResponse> getArticles(String source) async {
    Response response = await dio.get(
      '/v2/top-headlines',
      queryParameters: {'sources': source},
    );

    return ArticlesResponse.fromJson(response.data);
  }

  Future<ArticlesResponse> searchArticles({
    required String query,
    required String sources,
  }) async {
    Response response = await dio.get(
      '/v2/top-headlines',
      queryParameters: {'q': query, 'sources': sources},
    );

    return ArticlesResponse.fromJson(response.data);
  }
}
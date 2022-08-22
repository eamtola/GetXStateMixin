import 'package:getmixin_using_api/data/datasource/api_datasource.dart';
import 'package:getmixin_using_api/domain/entities/news_respone.dart';
import 'package:getmixin_using_api/domain/repository/news_repository.dart';

class NewsResposImpl extends NewsRepository {
  final ApiDatasource _api;
  NewsResposImpl({
    required ApiDatasource apiDatasource,
  }) : _api = apiDatasource;
  @override
  Future<NewsRespone> getNews() async {
    final response = await _api.getNewsRes();
    if (response.statusCode == 200) {
      return NewsRespone.fromMap(response.body);
    } else {
      return const NewsRespone.empty();
    }
  }
}

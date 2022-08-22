import 'package:getmixin_using_api/domain/entities/news_respone.dart';

abstract class NewsRepository {
  Future<NewsRespone> getNews();
}

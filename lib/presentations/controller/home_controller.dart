import 'package:get/state_manager.dart';
import 'package:getmixin_using_api/domain/entities/article.dart';
import 'package:getmixin_using_api/domain/entities/news_respone.dart';

import 'package:getmixin_using_api/domain/usecase/get_news_usecase.dart';

class HomeController extends GetxController with StateMixin<List<Article>> {
  final GetNewsUseCase _getNewsUseCase;
  HomeController({
    required GetNewsUseCase getNewsUseCase,
  }) : _getNewsUseCase = getNewsUseCase;

  List<Article> article = [];
  NewsRespone newsRespone = const NewsRespone.empty();
  @override
  void onReady() {
    getNews();
    super.onReady();
  }

  Future<void> getNews() async {
    change(article, status: RxStatus.loading());
    final result = await _getNewsUseCase.call(null);
    if (result.isSuccess) {
      article = result.news.articles;
      if (result.news.articles.isEmpty) {
        change(article, status: RxStatus.empty());
      } else {
        change(article, status: RxStatus.success());
      }
    } else {
      article = result.news.articles;
      change(article, status: RxStatus.error());
    }
  }
}

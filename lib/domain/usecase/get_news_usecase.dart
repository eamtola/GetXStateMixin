import 'package:getmixin_using_api/domain/entities/news_respone.dart';
import 'package:getmixin_using_api/domain/repository/news_repository.dart';
import 'package:getmixin_using_api/domain/usecase/usecase.dart';

abstract class GetNewsUseCase extends BaseUseCase<GetNewsResult, void> {}

class GetNewsUseCaseImpl extends GetNewsUseCase {
  final NewsRepository _repository;
  GetNewsUseCaseImpl({
    required NewsRepository newsRepository,
  }) : _repository = newsRepository;
  @override
  Future<GetNewsResult> call(void params) async {
    try {
      return GetNewsResult(news: await _repository.getNews());
    } on Exception {
      return GetNewsResult(news: const NewsRespone.empty());
    }
  }
}

class GetNewsResult extends UseCaseResult {
  final NewsRespone news;
  final Exception? exception;
  GetNewsResult({
    required this.news,
    this.exception,
  }) : super(exception: exception);
}

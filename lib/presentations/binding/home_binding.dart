import 'package:get/get.dart';
import 'package:getmixin_using_api/data/repository/news_repos_impl.dart';
import 'package:getmixin_using_api/domain/repository/news_repository.dart';
import 'package:getmixin_using_api/domain/usecase/get_news_usecase.dart';
import 'package:getmixin_using_api/presentations/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewsRepository>(NewsResposImpl(apiDatasource: Get.find()));
    Get.put<GetNewsUseCase>(GetNewsUseCaseImpl(newsRepository: Get.find()));
    Get.put<HomeController>(HomeController(getNewsUseCase: Get.find()));
  }
}

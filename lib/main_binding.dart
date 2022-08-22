import 'package:get/get.dart';
import 'package:getmixin_using_api/data/datasource/api_datasource.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiDatasource());
  }
}

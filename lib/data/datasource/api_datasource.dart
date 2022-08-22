import 'package:get/get.dart';

class ApiDatasource extends GetConnect {
  static const url =
      'https://newsapi.org/v2/everything?apiKey=1fa10ecee99442c5b60f08fe5837f4b0&domains=freshnewsasia.com';
  Future<Response> getNewsRes() async {
    return await get(url);
  }
}

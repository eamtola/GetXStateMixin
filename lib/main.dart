import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmixin_using_api/main_binding.dart';
import 'package:getmixin_using_api/presentations/binding/home_binding.dart';
import 'package:getmixin_using_api/presentations/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBinding(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding(),
        )
      ],
      initialRoute: '/home',
    );
  }
}

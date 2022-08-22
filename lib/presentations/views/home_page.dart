import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getmixin_using_api/presentations/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              final data = state[index];
              return Card(
                child: Column(
                  children: [
                    data.urlToImage.isNotEmpty
                        ? Image.network(data.urlToImage)
                        : const SizedBox.shrink(),
                    Text(
                      data.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.description,
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              );
            },
          ),
          onEmpty: const Center(child: Text('No FRESH NEWS')),
          onError: (_) => const Center(child: Text('Something went wrong!')),
          onLoading: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('FRESH NEWS'),
      centerTitle: true,
    );
  }
}

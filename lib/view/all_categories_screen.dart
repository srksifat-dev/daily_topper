import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../core/data/dummy_data.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});

  final newsController = Get.put(NewsViewModelController());
  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> categories = newsController.getCategories();
    return Scaffold(
      appBar: buildAppBar(),
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Image.asset(
              categories[index]["image"]!,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              categories[index]["label"]!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Categories"),
    );
  }
}

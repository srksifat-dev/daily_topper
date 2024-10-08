import 'package:animate_do/animate_do.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});

  final newsController = Get.put(NewsViewModelController());
  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> categories = newsController.getCategories();
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(categories),
    );
  }

  Widget buildBody(List<Map<String, String>> categories) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => ZoomIn(
        delay: Duration(milliseconds: (index + 1) * 100),
        child: Column(
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
      title: Text("categories".tr),
    );
  }
}

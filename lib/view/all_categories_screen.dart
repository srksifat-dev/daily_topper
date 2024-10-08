import 'package:animate_do/animate_do.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});

  final newsController = Get.put(NewsViewModelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Obx(() {
      switch (newsController.rxStatus.value){
        case Status.Loading:
          return const CircularProgressIndicator();
        case Status.Loaded:
          return GridView.builder(
            itemCount: newsController.rxCategoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => ZoomIn(
              delay: Duration(milliseconds: (index + 1) * 100),
              child: Column(
                children: [
                  Image.asset(
                    newsController.rxCategoryList[index]["image"]!,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    newsController.rxCategoryList[index]["label"]!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        case Status.Error:
          return Center(child: Text("error".tr),);
      }

      }
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("categories".tr),
    );
  }
}

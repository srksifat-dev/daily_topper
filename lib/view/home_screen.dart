import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:daily_topper/utils/extensions/widget_extensions.dart';
import 'package:daily_topper/utils/widgets/carousel.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final newsController = Get.put(NewsViewModelController());

  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> categories = newsController.getCategories();
    List<NewsModel> news = newsController.getNews();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            logo(context),
            buildQuickAction(context: context).paddingAll(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "categories".tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).paddingOnly(left: 16),
                TextButton.icon(
                  onPressed: () {
                    context.pushNamed(Routes.allCategoryScreen);
                  },
                  label: Text(
                    "view_all".tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
            ImageCarousel(
              elementlist: categories,
            ),
            const SizedBox(
              height: 8,
            ),
            buildNewsSection(news)
          ],
        ),
      ),
    );
  }

  Widget buildNewsSection(List<NewsModel> news) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            context.pushNamed(Routes.newsDetails,extra: news[index]);
          },
          leading: Image.asset(
            news[index].url!,
            width: context.screenWidth * 24,
            fit: BoxFit.cover,
          ),
          title: Text(
            news[index].title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        separatorBuilder: (_, __) => const Divider().paddingSymmetric(horizontal: 16),
        itemCount: news.length,
      ),
    );
  }

  Widget buildQuickAction({required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: const WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("trending".tr),
            icon: const Icon(Icons.trending_up).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: const WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("top_10_today".tr),
            icon: const Icon(Icons.star).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: const WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("archived_news".tr),
            icon: const Icon(Icons.bookmark).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: const WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("marked_news".tr),
            icon: const Icon(Icons.border_color).paddingOnly(right: 8),
          ),
        ],
      ),
    );
  }

  Widget logo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "app_name".tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "app_moto".tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:daily_topper/core/routes/navbar.dart';
import 'package:daily_topper/main.dart';
import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:daily_topper/utils/extensions/widget_extensions.dart';
import 'package:daily_topper/utils/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:go_router/go_router.dart';

import '../core/data/dummy_data.dart';
import '../core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
            ImageCarousel(
              elementlist: Dummy.categories,
            ),
            SizedBox(
              height: 8,
            ),
            buildNewsSection()
          ],
        ),
      ),
    );
  }

  Widget buildNewsSection() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            context.pushNamed(Routes.newsDetails,extra: Dummy.news[index]);
          },
          leading: Image.asset(
            Dummy.news[index].url!,
            width: context.screenWidth * 24,
            fit: BoxFit.cover,
          ),
          title: Text(
            Dummy.news[index].title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        separatorBuilder: (_, __) => Divider().paddingSymmetric(horizontal: 16),
        itemCount: Dummy.news.length,
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
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("trending".tr),
            icon: Icon(Icons.trending_up).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("top_10_today".tr),
            icon: Icon(Icons.star).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("archived_news".tr),
            icon: Icon(Icons.bookmark).paddingOnly(right: 8),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              textStyle: WidgetStatePropertyAll(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: "Roboto"),
              ),
              iconSize: WidgetStatePropertyAll(24)
            ),
            onPressed: () {},
            label: Text("marked_news".tr),
            icon: Icon(Icons.border_color).paddingOnly(right: 8),
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

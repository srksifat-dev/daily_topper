import 'dart:math';

import 'package:daily_topper/core/data/dummy_data.dart';
import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:daily_topper/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailsScreen({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    NewsModel relatedNews = Dummy.news[Random().nextInt(Dummy.news.length)];
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                news.url!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                height: context.screenWidth * 100,
                width: context.screenWidth * 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.5, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: context.screenHeight * 48,
              left: 16,
              right: 16,
              child: Text(
                news.title!,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.screenWidth * 102,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "posted_by".tr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto",
                                color: Colors.black45,
                              ),
                            ),
                            TextSpan(
                              text: " ${news.author} ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                color: Colors.black45,
                              ),
                            ),
                            TextSpan(
                              text: "at".tr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto",
                                color: Colors.black45,
                              ),
                            ),
                            TextSpan(
                              text: " ${news.publishedAt ?? ""}",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto",
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        news.content!,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontFamily: "Roboto"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "source".tr),
                            TextSpan(
                                text: ": ${news.source?.name ?? "Unknown"}, "),
                            TextSpan(text: news.source?.publishedAt ?? ""),
                          ],
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            fontWeight: FontWeight.normal,
                            fontFamily: "Roboto",
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ).padding(all: 16),
                ),
              ),
            ),
            Positioned(
              top: context.screenHeight * 41,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text("daily_topper".tr)
                      .paddingSymmetric(horizontal: 8, vertical: 2),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 10,
              child: Stack(
                children: [
                  Container(
                    height: context.screenHeight * 8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("${relatedNews.url}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: context.screenHeight * 8,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${relatedNews.title}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text("related_news".tr,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: Colors.white,
                                ),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8,),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          radius: 16,
                          child: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 20,),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 12, vertical: 8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

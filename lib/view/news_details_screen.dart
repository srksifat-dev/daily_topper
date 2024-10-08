import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:daily_topper/utils/extensions/widget_extensions.dart';
import 'package:daily_topper/utils/widgets/text_splitter.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel news;

  NewsDetailsScreen({required this.news, super.key});

  final newsController = Get.put(NewsViewModelController());

  @override
  Widget build(BuildContext context) {
    final newsList = newsController.rxNewsList;
    NewsModel relatedNews = newsList[Random().nextInt(newsList.length)];
    return Scaffold(
      body: buildBody(context, relatedNews),
    );
  }

  SizedBox buildBody(BuildContext context, NewsModel relatedNews) {
    TextSplitter contentSplitter = TextSplitter(
      maxWidth: (context.screenWidth * 100) - 32,
      textStyle:
          Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily: "Roboto"),
    );

    TextSplitter titleSplitter = TextSplitter(
      maxWidth: (context.screenWidth * 100) - 32,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
    );

    List<String> contentLines = contentSplitter.splitText(news.content!);
    List<String> titleLines = titleSplitter.splitText(news.title!);
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          FadeIn(
            delay: const Duration(milliseconds: 100),
            child: SlideInRight(
              from: 500,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  news.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FadeIn(
            delay: const Duration(milliseconds: 100),
            child: SlideInRight(
              from: 500,
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
          ),
          Positioned(
            bottom: context.screenHeight * 48,
            left: 16,
            right: 16,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: titleLines.length,
              itemBuilder: (context, index) => FadeIn(
                delay: Duration(milliseconds: (index + 1) * 100),
                child: SlideInRight(
                  from: 500,
                  delay: Duration(milliseconds: (index + 1) * 100),
                  child: Text(
                    titleLines[index],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FadeIn(
              delay: const Duration(milliseconds: 200),
              child: SlideInUp(
                delay: const Duration(milliseconds: 200),
                from: 500,
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
                        FadeIn(
                          delay: const Duration(milliseconds: 300),
                          child: SlideInUp(
                            delay: const Duration(milliseconds: 300),
                            child: buildNewsAuthor(
                              context: context,
                              newsAuthor: news.author,
                              publishedAt: news.publishedAt,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contentLines.length,
                          itemBuilder: (context, index) => FadeIn(
                            delay: Duration(
                                milliseconds:
                                    index < 20 ? (index + 5) * 100 : 0),
                            child: SlideInUp(
                              delay: Duration(
                                  milliseconds:
                                      index < 20 ? (index + 4) * 100 : 0),
                              child: Text(
                                contentLines[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontFamily: "Roboto"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 1400),
                          child: SlideInUp(
                            delay: const Duration(milliseconds: 1400),
                            child: buildNewsSource(
                              context: context,
                              sourceName: news.source?.name,
                              publishedDateOfSource: news.source?.publishedAt,
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
            ),
          ),
          Positioned(
            top: context.screenHeight * 41,
            right: 20,
            child: ZoomIn(
              delay: const Duration(milliseconds: 1000),
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
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 10,
            child: FadeIn(
              delay: const Duration(milliseconds: 800),
              child: SlideInLeft(
                delay: const Duration(milliseconds: 900),
                child: buildRelatedNewsCard(context, relatedNews),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRelatedNewsCard(BuildContext context, NewsModel relatedNews) {
    return Stack(
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
                child: FadeIn(
                  delay: const Duration(milliseconds: 900),
                  child: SlideInLeft(
                    delay: const Duration(milliseconds: 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${relatedNews.title}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          "related_news".tr,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              FadeIn(
                delay: const Duration(milliseconds: 850),
                child: SlideInLeft(
                  delay: const Duration(milliseconds: 950),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    radius: 16,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 12, vertical: 8),
        ),
      ],
    );
  }

  Widget buildNewsSource({
    required BuildContext context,
    String? sourceName,
    String? publishedDateOfSource,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "source".tr),
          TextSpan(text: ": ${sourceName ?? "Unknown"}, "),
          TextSpan(text: publishedDateOfSource ?? ""),
        ],
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.normal,
              fontFamily: "Roboto",
              color: Colors.black38,
            ),
      ),
    );
  }

  Widget buildNewsAuthor({
    required BuildContext context,
    String? newsAuthor,
    String? publishedAt,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "posted_by".tr,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                  color: Colors.black45,
                ),
          ),
          TextSpan(
            text: " ${newsAuthor ?? "Unknown"} ",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  color: Colors.black45,
                ),
          ),
          TextSpan(
            text: "at".tr,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                  color: Colors.black45,
                ),
          ),
          TextSpan(
            text: " ${publishedAt ?? ""}",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                  color: Colors.black45,
                ),
          ),
        ],
      ),
    );
  }
}

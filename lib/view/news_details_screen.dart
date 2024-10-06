import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailsScreen({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.screenWidth * 102,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

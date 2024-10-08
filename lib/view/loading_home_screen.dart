import 'package:daily_topper/utils/widgets/logo.dart';
import 'package:daily_topper/utils/widgets/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingHomeScreen(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    enabled: true,
    highlightColor: Colors.grey.shade100,
    child: SafeArea(
      child: Column(
        children: [
          logo(context),
          const SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonPlaceholder(width: 150.0),
                ButtonPlaceholder(width: 160.0),
                ButtonPlaceholder(width: 180.0),
                ButtonPlaceholder(width: 160.0),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const CarouselPlaceholder(),
          const SizedBox(height: 16,),

          const ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          const SizedBox(height: 16,),

          const ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          const SizedBox(height: 16,),

          const ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
        ],
      ),
    ),
  );
}


import 'package:daily_topper/utils/extensions/screen_size_extension.dart';
import 'package:daily_topper/utils/extensions/widget_extensions.dart';
import 'package:daily_topper/view_models/controller/news_view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class ImageCarousel extends StatefulWidget {
  final List<Map<String,String>> elementlist;
  const ImageCarousel({super.key, required this.elementlist});
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final newsController = Get.put(NewsViewModelController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenWidth * 30,
      width: double.infinity,
      child: InfiniteCarousel.builder(
        itemCount: widget.elementlist.length,
        itemExtent: context.screenWidth * 24,
        itemBuilder: (context, itemIndex, realIndex) {
          return InkWell(
            onTap: (){
              setState(() {
                newsController.carouselIndex.value = itemIndex;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(widget.elementlist[itemIndex]["image"]!,)
                        .animatedPadding(duration: const Duration(milliseconds: 400),all:  itemIndex == newsController.carouselIndex.value ? 0 : 8,curve: Curves.easeOut),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      opacity: itemIndex != newsController.carouselIndex.value ? 0.7 : 0,
                      child: Container(
                        height: context.screenWidth * 24,
                        width: context.screenWidth * 24,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: itemIndex != newsController.carouselIndex.value ? 0.2 : 1,
                    child: Text(widget.elementlist[itemIndex]["label"]!,textAlign: TextAlign.center,))
              ],
            ),
          );
        },
        controller: newsController.carouselScrollController.value,
        loop: false,
        center: true,
        anchor: 0,
        velocityFactor: 0.5,
        onIndexChanged: (index) {
          setState(() {
            newsController.carouselIndex.value = index;
          });
        },
      ),
      // CarouselSlider(
      //   carouselController: carouselSliderController,
      //   items: List.generate(
      //     10,
      //     (index) {
      //       print("index: ${index.toDouble()}");
      //       return Image.asset("assets/images/category_national.png",height: currentIndex == index.toDouble() ? 100: 80,);
      //     },
      //   ),
      //   options: CarouselOptions(
      //     // height: 100,
      //     // aspectRatio: 1,
      //     viewportFraction: 0.2,
      //     disableCenter: false,
      //     enableInfiniteScroll: false,onScrolled: (index){
      //       print("currentIndex: $index");
      //       setState(() {
      //         currentIndex = index!;
      //       });
      //   }
      //   ),
      // ),
    );
  }
}

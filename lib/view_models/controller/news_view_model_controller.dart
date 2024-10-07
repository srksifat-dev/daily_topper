import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/repository/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewsViewModelController extends GetxController{
  final carouselScrollController = ScrollController().obs;
  final carouselIndex = 0.obs;

  final api = NewsRepository();

  List<NewsModel> getNews(){
    return api.getNews();
  }

  List<Map<String,String>>getCategories(){
    return api.getCategories();
  }
}
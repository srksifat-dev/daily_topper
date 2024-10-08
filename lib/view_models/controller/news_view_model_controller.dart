import 'package:daily_topper/models/news_model.dart';
import 'package:daily_topper/repository/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Status{
  Loading,
  Loaded,
  Error,
}

class NewsViewModelController extends GetxController{
  final carouselScrollController = ScrollController().obs;
  final carouselIndex = 0.obs;

  final rxStatus = Status.Loading.obs;
  final rxNewsList = <NewsModel>[].obs;
  final rxCategoryList = <Map<String,String>>[].obs;

  void setStatus(Status status) => rxStatus.value = status;
  void setNewsList(List<NewsModel> news) => rxNewsList.value = news;
  void setCategoryList(List<Map<String,String>> categories) => rxCategoryList.value = categories;

  final api = NewsRepository();

  @override
  void onInit() {
    getNews();
    getCategories();
    super.onInit();
  }

  void getNews()async{
    setStatus(Status.Loading);
    await Future.delayed(const Duration(seconds: 3)).then((_)=> setStatus(Status.Loaded));
    setNewsList(api.getNews());
  }

  void getCategories()async{
    setStatus(Status.Loading);
    await Future.delayed(const Duration(seconds: 3)).then((_)=> setStatus(Status.Loaded));
    setCategoryList(api.getCategories());
  }
}
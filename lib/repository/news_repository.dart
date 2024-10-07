import 'package:daily_topper/core/data/dummy_data.dart';
import 'package:daily_topper/models/news_model.dart';

class NewsRepository{
  final dummyData = Dummy();

  List<NewsModel> getNews(){
    return dummyData.news;
  }

  List<Map<String,String>>getCategories(){
    return dummyData.categories;
  }
}
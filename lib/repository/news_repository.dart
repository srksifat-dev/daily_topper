import 'package:daily_topper/core/data/dummy_data.dart';
import 'package:daily_topper/models/news_model.dart';

class NewsRepository{
  // TODO: This will be instance of network service class
  final dummyData = Dummy();

  // Get all news from API
  List<NewsModel> getNews(){
    // TODO: This will be network calling
    return dummyData.news;
  }

  // Get all categories if there is a separated categories API end point
  List<Map<String,String>>getCategories(){
    // TODO: This will be network calling
    return dummyData.categories;
  }
}
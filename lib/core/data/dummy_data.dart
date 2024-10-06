import 'package:daily_topper/models/source_model.dart';

import '../../models/news_model.dart';
class Dummy{
  static const List<NewsModel> news = [
    NewsModel(
      id: "1",
      author: "Mahir",
      content:
      "Bangladesh’s Prime Minister Sheikh Hasina has resigned and fled the country following weeks of deadly demonstrations against her government. The removal of Hasina on Monday followed weeks of deadly protests and appears to have averted the threat of further bloodshed. The focus now moves to who will control the South Asian country.",
      publishedAt: "July 23,2024; 09:00 PM",
      source: SourceModel(
        id: "1",
        name: "Prothom Alo",
        publishedAt: "July 23, 2024",
      ),
      title:
      "Bangladesh protest updates: Sheikh Hasina quits, interim gov't taking over",
      url: "assets/images/news1.jpeg",
    ),
    NewsModel(
      id: "2",
      author: "Mahir",
      content:
      "Pan Zhanle did the unthinkable on Wednesday in the men’s 100 meter freestyle. The 19-year-old didn’t just break the most difficult world record in swimming, but he smashed it by 0.4 seconds — and beat second place by 1.08 seconds, a full body length. What has ensued from that moment is, in a word, ugly. There have been allegations of doping from one side, claims of racism from the other, and in the middle the inescapable reality that what ensued simply doesn’t make sense.",
      publishedAt: "July 23,2024; 09:00 PM",
      source: SourceModel(
        id: "1",
        name: "Prothom Alo",
        publishedAt: "July 23, 2024",
      ),
      title:
      "Pan Zhanle’s new swimming world-record at Olympics makes no sense, and that’s the problem",
      url: "assets/images/news2.png",
    ),
    NewsModel(
      id: "3",
      author: "Mahir",
      content:
      "No matter what Biden says or how much his fellow Democrats try to build up his accomplishments as president, multiple Republicans have argued that the 25th Amendment to the Constitution should be used to remove Biden from office ASAP – something that’s not going to happen since no Democrat supports it.",
      publishedAt: "July 23,2024; 09:00 PM",
      source: SourceModel(
        id: "1",
        name: "Prothom Alo",
        publishedAt: "July 23, 2024",
      ),
      title:
      "What to know about the 25th Amendment as Trump makes wild claim about Biden",
      url: "assets/images/news3.png",
    ),
    NewsModel(
      id: "4",
      author: "Mahir",
      content:
      "গাজীপুরের কাশিমপুর হাইসিকিউরিটি কেন্দ্রীয় কারাগারের পর গাজীপুর জেলা কারাগারে অস্থিরতা দেখা দিয়েছে। আজ বৃহস্পতিবার সকাল থেকে সেখানে উত্তেজনা ও বিক্ষোভ শুরু করেছেন বন্দীরা। কারাগারের বাইরে থেকে গুলির শব্দ শোনা গেছে। এ ঘটনায় আহত হয়েছেন ১৬ জন। গাজীপুর জেলা কারা হাসপাতালের চিকিৎসক মাকসুদা বলেন, কারাগারে বন্দীরা বিদ্রোহ করেছেন। এ ঘটনায় ১৬ জন আহত হয়েছেন। এঁদের মধ্যে কেউ মাথায়, কেউ চোখে, কেউবা পায়ে আঘাত পেয়েছেন। আহত সবাইকে প্রাথমিক চিকিৎসা দেওয়া হয়েছে। আহত ব্যক্তিদের মধ্যে ১৩ জন কারাবন্দী ও তিনজন কারারক্ষী আছেন।",
      publishedAt: "July 23,2024; 09:00 PM",
      source: SourceModel(
        id: "1",
        name: "Prothom Alo",
        publishedAt: "July 23, 2024",
      ),
      title:
      "গাজীপুর জেলা কারাগারে বিক্ষোভ-গুলি, আহত ১৬, কাশিমপুর কারাগারের সুপার প্রত্যাহার",
      url: "assets/images/news4.png",
    ),
    NewsModel(
      id: "5",
      author: "Mahir",
      content:
      "The Gaza Strip’s health services have entered a “critical stage,” Palestinian health authorities say. In its daily update, the Israeli Defense Forces said 2,600 “terrorist targets” inside the Gaza Strip have been struck, including the Islamic University, which Hamas militants are said to be using as a training camp.",
      publishedAt: "July 23,2024; 09:00 PM",
      source: SourceModel(
        id: "1",
        name: "Prothom Alo",
        publishedAt: "July 23, 2024",
      ),
      title:
      "Israel-Hamas war updates: Israel says 2,600 ‘terrorist targets’ struck; Gaza’s health services enter ‘critical stage’",
      url: "assets/images/news5.png",
    ),
  ];


  static const List<Map<String, String>> categories = [
    {'image': 'assets/images/category_national.png', 'label': 'National'},
    {
      'image': 'assets/images/category_international.png',
      'label': 'International'
    },
    {'image': 'assets/images/category_sport.png', 'label': 'Sports'},
    {'image': 'assets/images/category_finance.png', 'label': 'Finance'},
    {'image': 'assets/images/category_politics.png', 'label': 'Politics'},
    {
      'image': 'assets/images/category_entertainment.png',
      'label': 'Entertainment'
    },
  ];
}





// https://newsapi.org/v2/top-headlines?country=us&apiKey=a1acfe2e899b4b469c3629dce75951d2
// https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=caea254bf2f94f869e831ec24284ece1
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app/model/newsart.dart';

class FetchNews{
  static List sourcesId = [
    "abc-news",
 
    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
   
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",
    
    "national-geographic",
 
    "news24",
    "new-scientist",
   
    "new-york-magazine",
    "next-big-future",
  
    "techcrunch",
    "techradar",
   
    "the-hindu",
   
    "the-wall-street-journal",
    
    "the-washington-times",
    "time",
    "usa-today",
    
  ];
   
   static Future<NewsArt> fetchNews() async{
      final _random= new Random();
      var element= sourcesId[_random.nextInt(sourcesId.length)];
      print(element);

    Response response= await get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=$element&apiKey=a1acfe2e899b4b469c3629dce75951d2')
      );
      Map body_data = jsonDecode(response.body);
      List articles=body_data["articles"];
      print(articles);

     final _newrandom= new Random();
      var myArticle= articles[_random.nextInt(articles.length)];
      print(myArticle);
        return NewsArt.fromApiToApp(myArticle);
   }
}
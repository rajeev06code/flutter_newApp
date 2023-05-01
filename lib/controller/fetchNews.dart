// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=6241539934c14c3a89ee084d1e5d48bc

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newsapp/model/newsArticle.dart';

class FetchNews {
  static Future<NewsArticle> fetchNews() async {
    List sourcesId = [
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
    var random = Random();
    var sourceID = sourcesId[random.nextInt(sourcesId.length)];
    // print("========================$sourceID");
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=6241539934c14c3a89ee084d1e5d48bc"));
    Map responseData = jsonDecode(response.body);

    List articles = responseData["articles"];
    // print("========================ARTICLES$articles");

    final _Newrandom = Random();
    // print("========================NEWRANDOM$_Newrandom");
    var myArticle = articles[random.nextInt(articles.length)];
    // print("========================MYARTICLE$myArticle");
    return NewsArticle.fromApitoApp(myArticle);
  }
}

class NewsArticle {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsContent;
  String newsUrl;

  NewsArticle(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsUrl,
      required this.newsContent});

  static NewsArticle fromApitoApp(Map<String, dynamic> article) {
    return NewsArticle(
        imgUrl: article["urlToImage"] ??
            "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
        newsHead: article["title"] ?? "--",
        newsDesc: article["description"] ?? "--",
        newsUrl: article["url"] ??
            "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en",
        newsContent: article["content"] ?? "--");
  }
}

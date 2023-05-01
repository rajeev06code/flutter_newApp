import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/model/newsArticle.dart';
import 'package:newsapp/view/widgets/NewsContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsArticle newsArt;
  getNews() async {
    newsArt = await FetchNews.fetchNews();
    // print(FetchNews.fetchNews());
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              getNews();
            },
            itemBuilder: (context, index) {
              return NewsContainer(
                  imgUrl: newsArt.imgUrl,
                  // "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
                  newsHead: newsArt.newsHead,
                  newsContent: newsArt.newsDesc,
                  newsDesc: newsArt.newsContent,
                  newsUrl: newsArt.newsUrl);
            }),
      ),
    );
  }
}

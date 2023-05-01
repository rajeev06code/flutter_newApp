import 'package:flutter/material.dart';
import 'package:newsapp/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl = "";
  String newsHead = "";
  String newsDesc = "";
  String newsUrl = "";
  String newsContent = "";
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsUrl,
      required this.newsContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              newsHead.length > 100 ? newsHead.substring(0, 100) : newsHead,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              newsContent.length > 100
                  ? newsContent.substring(0, 100)
                  : newsContent,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              newsDesc,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailViewScreen(newsUrl: newsUrl)));
                    },
                    child: Text("Read More")),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
    ;
  }
}

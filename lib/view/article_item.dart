import 'package:demo/Models/articles.dart';
import 'package:demo/view/webview_screen.dart';
import 'package:flutter/material.dart';


class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(url: article.url!)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              article.urlToImage!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height/2 ,
            ),
            SizedBox(height: 10.0),
            Text(
              article.title!,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                  fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8.0),
            Text(
              article.description!,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

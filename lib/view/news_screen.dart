import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/Models/articles.dart';
import 'package:demo/key/topics.dart';
import 'package:demo/services/art_api.dart';
import 'package:demo/view/article_item.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  final ArticleApi articleApi;
  const NewScreen({Key? key, required this.articleApi}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late String _topicName;

  @override
  void initState() {
    _topicName = topics[0].name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildTopics(context),
          SizedBox(height: 25),
          _buildArticles(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: RichText(
        text: TextSpan(
          text: 'Flutter',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          children: const <TextSpan>[
            TextSpan(
              text: 'News',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildTopics(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: topics.length,
      itemBuilder: (_, index, realIndex) {
        return InkWell(
          onTap: () {
            if (_topicName.toLowerCase() != topics[index].name.toLowerCase()) {
              _topicName = topics[index].name;
              setState(() {});
            }
          },
          child: Container(
            width: 1000,
            height: 200,
            padding: MediaQuery.of(context).padding/2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(topics[index].backgroundUrl),
                  fit: BoxFit.cover,

              ),
            ),

            alignment: Alignment.center,
            child: Text(
              topics[index].name,
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 2.2,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.ease,
        autoPlayInterval: Duration(seconds: 2),
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        initialPage: 0,
        scrollDirection: Axis.horizontal,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeStrategy: CenterPageEnlargeStrategy.height,

      ),
    );
  }

  Widget _buildArticles(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: widget.articleApi.getListArticles(_topicName),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child:
            Text(snapshot.error.toString().replaceFirst('Exception: ', '')),
          );
        }
        List<Article> _list = snapshot.data!;
        return Column(
          children: List.generate(_list.length, (index) {
            return ArticleItem(article: _list[index]);
          }),
        );
      },
    );
  }
}

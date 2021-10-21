import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage4(),
    );
  }
}
class HomePage4 extends StatefulWidget{
  const HomePage4 ({Key? key}) : super(key: key);

  @override
  _HomPage4State createState() => _HomPage4State();
}
class _HomPage4State extends State<HomePage4>{
  late Future<List<Photo>> lsPhoto;
  void initState(){
    super.initState();
     lsPhoto = Photo.fetchData();

  }
  Widget build(BuildContext context){
    return Scaffold(
        body: FutureBuilder(
          future: lsPhoto,
          builder: (BuildContext context,
              AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData ){
                List<Photo> data = snapshot.data;
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context, index){
                      var photo = data[index];
                      return ListTile(
                        leading: Image.network(photo.thumbnailUrl),
                        title: Text(photo.title),
                      );
                });
            }
            else
              return Center(child: CircularProgressIndicator());
          },

        ),
    );
  }
}

class Photo{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  static Future<List<Photo>> fetchData() async{
    String url = "https://jsonplaceholder.typicode.com/photos";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
      var result = response.body;
      var jsonData = jsonDecode(result);
      List<Photo> lsPhoto = [];
      for(var item in jsonData) {
        print(item);
        var albumId = item['albumId'];
        var id = item['id'];
        var title = item['title'];
        var url = item['url'];
        var thumbnailUrl = item['thumbnailUrl'];
        Photo p = new Photo(albumId, id, title, url, thumbnailUrl);
        lsPhoto.add(p);
      }
      return lsPhoto;
    }else{
      print(response.statusCode);
      throw Exception("Loi lay du lieu");
    }
  }
}
//library dart.ffi;
import 'dart:convert';
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaiTap extends StatelessWidget {
  const BaiTap({Key? key}) : super(key: key);

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
  late Future<List<Api>> lsApi;
  void initState(){
    super.initState();
    lsApi = Api.fetchData();

  }

  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: lsApi,
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData ){
            List<Api> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                  var api = data[index];
                  return ListTile(
                      leading: Image.network(api.image),
                    title:Column(
                      children: [
                        Text(api.title, style: TextStyle(fontSize: 20, color: Colors.red),),
                        Text(api.price, style: TextStyle(fontSize: 15, color: Colors.white),),
                        Text(api.description, style: TextStyle(fontSize: 15, color: Colors.black),)
                      ],
                    ),
                    trailing: Row(
                      children: [
                        FlatButton(
                          onPressed: (){},
                          color: Colors.orange,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.add_shopping_cart_sharp),
                              Text("Mua")
                            ],
                          ),
                        ),
                      ],
                    ),
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


class Api{
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rating;
  Api(this.id, this.title, this.price, this.description, this.category, this.image, this.rating);

  static Future<List<Api>> fetchData() async{
    String url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
      var result = response.body;
      var jsonData = jsonDecode(result);
      List<Api> lsApi = [];
      for(var item in jsonData) {
        print(item);
        var id = item['id'];
        var title = item['title'];
        var price = item['price'];
        var description = item['description'];
        var category = item['category'];
        var image = item['image'];
        var rating = item['rating'];
        Api p = new Api(id, title,price, description, category, image, rating);
        lsApi.add(p);
      }
      return lsApi;
    }else{
      print(response.statusCode);
      throw Exception("Loi lay du lieu");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomePage> {
  var data = ["Nguyen Van A", "Nguyen Thi B", "Tran Van C"];
  var lsEngLishWord = generateWordPairs().take(100).toList();
  createHeader() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: Text(
        "Trang chủ",
        style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
      ),
      leading: Icon(
        Icons.home,
        size: 30,
        color: Colors.orangeAccent,
      ),
    );
  }

  createBody() {
    return ListView.builder(
        itemCount: lsEngLishWord.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(child: Text((index + 1).toString())),
              title: Text(
                lsEngLishWord[index].asString,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  InkWell(
                      // hoặc  GestureDetector()
                      onTap: () {
                        print("Đã nhấn vào đây $index");
                      },
                      child: Icon(Icons.linked_camera)),
                ],
              ),
            ),
          );
        });
  }

  createBottom() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(), //cat vat button
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.orange,
                size: 40,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: Colors.orange,
                size: 40,
              )),
        ],
      ),
    );
  }

  createFloatAction() {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createHeader(),
      body: createBody(),
      bottomNavigationBar: createBottom(),
      floatingActionButton: createFloatAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

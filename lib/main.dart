import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/myapp3.dart';
import 'login.dart';
import 'myapp4.dart';
import 'BTCungCo.dart';


void main() {
  runApp(BaiTap());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
/*Widget creatColumn (String data, IconData icon, Color color, double size){
  return Column(
    children: [
      Icon(Icons.call, color: Colors.red, size:30,textDirection: TextDirection.ltr,),
      Text("Call", textDirection: TextDirection.ltr,style: TextStyle(color: Colors.red),)
  ],
  );
  }*/
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:200.0, left: 20),
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.call, color: Colors.red, size:30,textDirection: TextDirection.ltr,),
              Text("Call", textDirection: TextDirection.ltr,style: TextStyle(color: Colors.red),)
            ],
        ),
        ),
      ) ,
    );
  }
}

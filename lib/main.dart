import 'package:demo/myapp3.dart';
import 'package:demo/services/art_services.dart';
import 'package:demo/view/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/list_product_screen.dart';
import 'package:demo/HomeScreen.dart';
import 'package:demo/screens/input.dart';
void main() {
  runApp( BMICalculator());
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter News',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         backgroundColor: Colors.white,
//         primaryColor: Colors.blue,
//       ),
//       home: NewScreen(articleApi: ArticleServices()),
//     );
//   }
// }

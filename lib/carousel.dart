//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:carousel_slider/carousel_slider.dart';
//
// class carousel extends StatelessWidget {
//   const carousel({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage4(),
//     );
//   }
// }
//
// class HomePage4 extends StatefulWidget {
//   const HomePage4({Key? key}) : super(key: key);
//
//   @override
//   _HomPage4State createState() => _HomPage4State();
// }
//
// class _HomPage4State extends State<HomePage4> {
//   late Future<List<Photo>> lsPhoto;
//   void initState() {
//     super.initState();
//     lsPhoto = Photo.fetchData();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: lsPhoto,
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.hasData) {
//             List<Photo> data = snapshot.data;
//             return CarouselSlider(
//
//             } else
//             return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
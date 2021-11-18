import 'package:demo/models/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = double.tryParse(json['price'].toString());
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }

  String getPrice() {
    if (this.price == null || this.price == 0) return "0 \$";
    return "${this.price} \$";
  }

  Widget buildRatingWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //average rating
        RatingStars(
          value: this.rating?.rate ?? 0.0,
          onValueChanged: (v) {},
          starBuilder: (_, color) => Icon(
            Icons.star,
            color: color,
            size: 14.0,
          ),
          starCount: 5,
          starSize: 14.0,
          valueLabelColor: Colors.red,
          valueLabelTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 8.0,
          ),
          valueLabelRadius: 5,
          maxValue: 5.0,
          starSpacing: 2.0,
          maxValueVisibility: true,
          valueLabelVisibility: true,
          valueLabelPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 4.0),
          valueLabelMargin: EdgeInsets.symmetric(horizontal: 4.0),
          starOffColor: Color(0xffe7e8ea),
          starColor: Colors.yellow,
        ),
        //total rating
        SizedBox(width: 2.0),
        Text(
          "(${this.rating?.count ?? 0})",
          style: TextStyle(
            color: Color(0xFF1a1a1a),
            fontWeight: FontWeight.w400,
            fontSize: 8.0,
          ),
        ),
      ],
    );
  }
}

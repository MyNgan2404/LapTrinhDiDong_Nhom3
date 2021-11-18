import 'package:demo/models/product.dart';
import 'package:demo/product_item.dart';
import 'package:demo/implement/product_services.dart';
import 'package:demo/services/product_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductService();
    CarouselController carouselController = CarouselController();

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder<List<Product>>(
        future: productApi.getListProducts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  snapshot.error.toString().replaceFirst("Exception: ", "")),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text("Danh sách rỗng"),
            );
          }
          List<Product> listProduct = snapshot.data!;
          return Center(
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: listProduct.length,
              itemBuilder: (context, index, realIndex) {
                return ProductItem(
                  product: listProduct[index],
                );
              },
              options: CarouselOptions(
                aspectRatio: 1.0,
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
            ),
          );
          // return GridView.builder(
          //   padding: EdgeInsets.only(top: 24.0, bottom: 50),
          //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          //     mainAxisExtent: 209.0,
          //     mainAxisSpacing: 15.0,
          //   ),
          //   itemCount: listProduct.length,
          //   itemBuilder: (context, index) =>
          //       ProductItem(product: listProduct[index]),
          // );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        "Danh sách sản phẩm",
        style: TextStyle(
          color: Color(0xFF1a1a1a),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}

import 'package:demo/models/product.dart';
import 'package:demo/product_detail_dialog.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => showProductDetail(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff141A1A1A),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _productImage(context)),
            widget.product.buildRatingWidget(),
            _productInfor(context),
          ],
        ),
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    if (widget.product.image == null)
      return Container(
        margin: EdgeInsets.only(bottom: 4.0),
        alignment: Alignment.center,
        child: Text("Error Image"),
      );
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        image: DecorationImage(
          image: NetworkImage(
            widget.product.image!,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _productInfor(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(11.0, 4.0, 11.0, 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.product.title}",
            style: TextStyle(
              color: Color(0xFF1a1a1a),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.0),
          Text(
            widget.product.getPrice(),
            style: TextStyle(
              color: Color(0xFF1a1a1a),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void showProductDetail(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(16),
          child: ProductDetailDialog(product: widget.product),
        );
      },
    );
  }
}

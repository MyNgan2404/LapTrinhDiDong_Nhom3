import 'dart:async';

import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailDialog extends StatefulWidget {
  final Product product;
  const ProductDetailDialog({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailDialogState createState() => _ProductDetailDialogState();
}

class _ProductDetailDialogState extends State<ProductDetailDialog> {
  StreamController<int> _quantityController = StreamController<int>()..add(0);

  @override
  void dispose() {
    _quantityController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 450),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          //product name
          Container(
            constraints: BoxConstraints(minHeight: 40.0),
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.center,
            child: Text(
              """${widget.product.title}""",
              style: TextStyle(
                color: Color(0xFF1a1a1a),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //image
                    _productImage(context),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //price
                        Text(
                          widget.product.getPrice(),
                          style: TextStyle(
                            color: Color(0xFF1a1a1a),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        //rating
                        widget.product.buildRatingWidget(),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                _buildDescription("Danh mục", widget.product.category),
                SizedBox(height: 10.0),
                _buildDescription("Mô tả", widget.product.description),
                SizedBox(height: 20.0),
                _buildQuantityInput(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(String? title, String? description) {
    return RichText(
      text: TextSpan(
        text: "$title: ",
        style: TextStyle(
          color: Color(0xFF1a1a1a),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "$description",
            style: TextStyle(
              color: Color(0xFF1a1a1a),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    if (widget.product.image == null)
      return Container(
        height: 80.0,
        width: 80.0,
        margin: EdgeInsets.only(bottom: 4.0),
        alignment: Alignment.center,
        child: Text("Error Image"),
      );
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
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

  Widget _buildQuantityInput(BuildContext context) {
    return StreamBuilder<int>(
      stream: _quantityController.stream,
      builder: (_, snapshot) {
        int quantity = snapshot.data ?? 0;
        return Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 36,
                    width: 80.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF1a1a1a),
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      "$quantity",
                      style: TextStyle(
                        color: Color(0xFF1a1a1a),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  _buildCounterButton(Icon(Icons.remove), onPressed: () {
                    //decrease quantity
                    if (quantity > 0) {
                      _quantityController.sink.add(quantity - 1);
                    }
                  }),
                  SizedBox(width: 10.0),
                  _buildCounterButton(Icon(Icons.add), onPressed: () {
                    //increase quantity
                    _quantityController.sink.add(quantity + 1);
                  }),
                ],
              ),
            ),
            _submitButton(context),
          ],
        );
      },
    );
  }

  Widget _buildCounterButton(Icon icon, {required void Function()? onPressed}) {
    return SizedBox(
      height: 36.0,
      width: 36.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.zero,
          primary: Colors.red,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Xác nhận"),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          // padding: EdgeInsets.zero,
          primary: Colors.red,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

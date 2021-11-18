import 'package:demo/models/product.dart';
import 'package:demo/services/product_api.dart';

class ProductService extends ProductApi {
  @override
  Future<List<Product>> getListProducts() {
    return getMethod("/products").then((value) {
      return value.map<Product>((e) => Product.fromJson(e)).toList();
    });
  }
}

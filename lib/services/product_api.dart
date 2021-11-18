import 'package:demo/models/product.dart';
import 'package:demo/services/base_api.dart';

abstract class ProductApi extends BaseApi {
  Future<List<Product>> getListProducts();
}

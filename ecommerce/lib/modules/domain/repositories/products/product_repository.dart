import 'package:ecommerce/modules/domain/entities/product/product.dart';

abstract class ProductRepository {
  Future<Product> getProducts();
}

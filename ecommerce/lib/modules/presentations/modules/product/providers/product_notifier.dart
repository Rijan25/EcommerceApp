import 'package:ecommerce/modules/domain/repositories/products/product_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/entities/product/product.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier(this._productRepository);
  final ProductRepository _productRepository;

  Product? product;

  fetchProduct(){
    
  }
}

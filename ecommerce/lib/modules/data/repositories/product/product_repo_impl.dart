import 'package:dio/dio.dart';
import 'package:ecommerce/modules/data/datasource/product/product_remote_data_source.dart';
import 'package:ecommerce/modules/domain/entities/product/product.dart';
import 'package:ecommerce/modules/domain/repositories/products/product_repository.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/services/get.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductRepoImpl(this._productRemoteDataSource);

  @override
  Future<Product> getProducts() async {
    try {
      return await _productRemoteDataSource.getProducts();
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow; // is reresed where it is being watched
    }
  }
}

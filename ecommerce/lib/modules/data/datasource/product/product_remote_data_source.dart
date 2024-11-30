import 'package:ecommerce/core/services/api_services/api_service.dart';
import 'package:ecommerce/core/utils/api_endpoints.dart';
import 'package:ecommerce/modules/data/models/product/product_model.dart';
import 'package:ecommerce/modules/domain/entities/product/product.dart';

abstract class ProductRemoteDataSource {
  Future<Product> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiManager _apiManager;
  ProductRemoteDataSourceImpl(this._apiManager);

  @override
  Future<Product> getProducts() async {
    final response = await _apiManager.get(ApiEndpoints.product);
    return ProductModel.fromJson(response.data['data']);
  }
}

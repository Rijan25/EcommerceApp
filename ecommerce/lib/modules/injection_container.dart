import 'package:ecommerce/modules/data/datasource/product/product_remote_data_source.dart';
import 'package:ecommerce/modules/data/repositories/product/product_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../abstractservices/storage_services.dart';
import '../core/services/api_services/api_service.dart';
import '../core/services/get.dart';
import 'domain/repositories/products/product_repository.dart';

//service dependencies
final storageServiceProvider = Provider<StorageServices>((ref) {
  final box = Get.box;
  ref.onDispose(() => box.close);
  return box;
});

final apiServiceProvider = Provider((ref) => ApiManager(ref));

final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>(
    (ref) => ProductRemoteDataSourceImpl(ref.read(apiServiceProvider)));

final productrepositoryProvider = Provider<ProductRepository>(
    (ref) => ProductRepoImpl(ref.read(productRemoteDataSourceProvider)));

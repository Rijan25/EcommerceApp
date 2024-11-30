import 'package:ecommerce/modules/domain/entities/product/product.dart';
import 'package:ecommerce/modules/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = FutureProvider<Product>(
    (ref) => ref.read(productrepositoryProvider).getProducts());

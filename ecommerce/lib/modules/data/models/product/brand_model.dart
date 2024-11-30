import 'package:ecommerce/modules/domain/entities/product/brand.dart';

class BrandModel extends Brand {
  BrandModel({required super.id, required super.slug, required super.name});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        id: json['_id'] as String,
        slug: json['slug'] as String,
        name: json['name'] as String);
  }
}

import 'package:ecommerce/modules/data/models/product/brand_model.dart';
import 'package:ecommerce/modules/domain/entities/product/product.dart';

import 'category_model.dart';
import 'color_attribute_model.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.slug,
      required super.title,
      required super.ingredient,
      required super.price,
      required super.rewardPoint,
      required super.commissionPercentage,
      required super.strikePrice,
      required super.offPercent,
      required super.minOrder,
      required super.maxOrder,
      required super.images,
      required super.colorAttributes,
      required super.brand,
      required super.howToUse,
      required super.description,
      required super.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['_id'] as String,
        slug: json['slug'] as String,
        title: json['title'] as String,
        ingredient: json['ingredient'] as String,
        price: json['price'] as int,
        rewardPoint: json['rewardPoint'] as int,
        commissionPercentage: json['commissionPercentage'] as int,
        strikePrice: json['strikePrice'] as int,
        offPercent: json['offPercent'] as int,
        minOrder: json['minOrder'] as int,
        maxOrder: json['maxOrder'] as int,
        images: json['images'],
        colorAttributes: List<ColorAttributeModel>.from(
            (json['colorAttributes'] as List<dynamic>).map<ColorAttributeModel>(
                (x) =>
                    ColorAttributeModel.fromJson(x as Map<String, dynamic>))),
        brand: BrandModel.fromJson(json['brand']),
        category: CategoryModel.fromJson(json['category']),
        howToUse: json['howToUse'] as String,
        description: json['description'] as String);
  }
}

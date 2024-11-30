import 'package:ecommerce/modules/domain/entities/product/brand.dart';
import 'package:ecommerce/modules/domain/entities/product/color_attributes.dart';

import 'category.dart';

class Product {
  final String id;
  final String slug;
  final String title;
  final String ingredient;
  final int price;
  final int rewardPoint;
  final int commissionPercentage;
  final int strikePrice;
  final int offPercent;
  final int minOrder;
  final int maxOrder;
  final String description;
  final String howToUse;

  final List<dynamic> images;
  final List<ColorAttributes> colorAttributes;
  final Brand brand;
  final Category category;

  Product(
      {required this.id,
      required this.slug,
      required this.title,
      required this.ingredient,
      required this.price,
      required this.rewardPoint,
      required this.commissionPercentage,
      required this.strikePrice,
      required this.offPercent,
      required this.minOrder,
      required this.maxOrder,
      required this.description,
      required this.howToUse,
      required this.images,
      required this.colorAttributes,
      required this.brand,
      required this.category});
}

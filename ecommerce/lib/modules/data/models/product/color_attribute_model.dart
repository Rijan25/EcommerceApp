import 'package:ecommerce/modules/domain/entities/product/color_attributes.dart';

class ColorAttributeModel extends ColorAttributes {
  ColorAttributeModel(
      {required super.id,
      required super.isTwin,
      required super.name,
      required super.colorValue});

  factory ColorAttributeModel.fromJson(Map<String, dynamic> json) {
    return ColorAttributeModel(
        id: json['_id'] as String,
        isTwin: json['isTwin'] as bool,
        name: json['name'] as String,
        colorValue: json['colorValue'][0].toString());
  }
}

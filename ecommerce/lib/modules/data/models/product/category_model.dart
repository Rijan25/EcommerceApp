import '../../../domain/entities/product/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id,
      required super.slug,
      required super.title,
      required super.level,
      required super.parentId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['_id'] as String,
        slug: json['slug'] as String,
        title: json['title'] as String,
        level: json['level'] as int,
        parentId: json['parentId'] as String);
  }
}

import 'package:hungyhub/src/features/other/domain/entity/category.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    String? id,
    String? name,
    String? image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

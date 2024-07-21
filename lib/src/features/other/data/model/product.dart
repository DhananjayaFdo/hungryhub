import 'package:hungyhub/src/features/other/data/model/unit_type.dart';

import '../../domain/entity/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String? id,
    String? name,
    String? image,
    String? categoryId,
    String? categoryName,
    int? price,
    List<UnitTypesModel>? unitType,
    String? description,
  }) : super(
          id: id,
          name: name,
          image: image,
          categoryId: categoryId,
          categoryName: categoryName,
          price: price,
          unitType: unitType,
          description: description,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      categoryId: json['category_id'] as String?,
      categoryName: json['categoty_name'] as String?,
      price: json['price'] as int?,
      unitType: List.castFrom(json['unit_type'] ?? []).map((e) => UnitTypesModel.fromJson(e)).toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'category_id': categoryId,
      'category_name': categoryName,
      'price': price,
      'unit_type': unitType,
      'description': description,
    };
  }
}

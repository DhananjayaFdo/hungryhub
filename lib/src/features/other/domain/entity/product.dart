import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';

class ProductEntity {
  String? id;
  String? name;
  String? image;
  String? categoryId;
  String? categoryName;
  int? price;
  List<UnitTypesEntity>? unitType;
  String? description;

  ProductEntity({
    this.id,
    this.name,
    this.image,
    this.categoryId,
    this.categoryName,
    this.price,
    this.unitType,
    this.description,
  });
}

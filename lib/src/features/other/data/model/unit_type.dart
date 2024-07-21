import '../../domain/entity/unit_type.dart';

class UnitTypesModel extends UnitTypesEntity {
  UnitTypesModel({
    String? name,
    String? value,
    int? price,
  }) : super(
          name: name,
          value: value,
          price: price,
        );

  factory UnitTypesModel.fromJson(Map<String, dynamic> json) {
    return UnitTypesModel(
      name: json['name'] as String?,
      value: json['value'] as String?,
      price: json['price'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'price': price,
    };
  }
}

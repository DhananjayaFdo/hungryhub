class CartItem {
  final String? id;
  final String? name;
  final String? image;
  final String? unitType;
  final int? price;
  final int? quantity;

  CartItem({
    this.id,
    this.name,
    this.image,
    this.unitType,
    this.price,
    this.quantity,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] as String?,
      name: map['name'] as String?,
      image: map['image'] as String?,
      unitType: map['unit_type'] as String?,
      price: map['price'] as int?,
      quantity: map['quantity'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'unit_type': unitType,
      'price': price,
      'quantity': quantity,
    };
  }
}

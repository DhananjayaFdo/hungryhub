class ProductParams {
  final int page;
  final String? categoryId;

  ProductParams({required this.page, this.categoryId});

  Map<String, dynamic> toJson() => {
        "page": page,
        "categoryId": categoryId,
      };
}

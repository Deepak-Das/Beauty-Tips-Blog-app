class CategoryModel {
  String? categoryId;
  String name;

  CategoryModel({
    this.categoryId,
    required this.name,
  });

  factory CategoryModel.fromJson(String categoryId, Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: categoryId,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'name': name,
    };
  }
}

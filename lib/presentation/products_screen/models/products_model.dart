class ProductsModel {
  final String id;
  final String name;
  final String imagePath;
  final double price;

  ProductsModel({required this.id, required this.name, required this.imagePath, required this.price});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'],
      imagePath: json['image_path'],
      price: json['price'],
    );
  }
}

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        price: (json['price'] as num).toDouble(),
      );
    } catch (e) {
      throw Exception('Error al mapear ProductModel');
    }
  }
}

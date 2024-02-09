class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String image;
  final String description;
  final String category;
  RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.ratingModel,
  });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      image: jsonData["image"],
      category: jsonData["category"],
      ratingModel: RatingModel.fromJson(jsonData["rating"]),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData["rate"],
      count: jsonData["count"],
    );
  }
}

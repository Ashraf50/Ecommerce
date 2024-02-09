class CategoryModel {
  final String categoryName;
  final String categoryImage;
  CategoryModel({required this.categoryImage, required this.categoryName});
}

List allCategories = [
  CategoryModel(
    categoryName: "electronics",
    categoryImage: "assets/electronics.png",
  ),
  CategoryModel(
    categoryName: "jewelery",
    categoryImage: "assets/jewelery.png",
  ),
  CategoryModel(
    categoryName: "men's clothing",
    categoryImage: "assets/menclothing.png",
  ),
  CategoryModel(
    categoryName: "women's clothing",
    categoryImage: "assets/womenclothing.png",
  )
];

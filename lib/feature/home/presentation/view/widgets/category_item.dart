import 'package:Ecommerce/core/model/category_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryName;

  final CategoryModel categoryImage;
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryImage.categoryImage,
              width: 40,
              height: 40,
            ),
            Text(
              categoryName.categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

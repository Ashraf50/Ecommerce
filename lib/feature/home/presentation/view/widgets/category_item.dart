import 'package:Ecommerce/core/model/category_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryName;
  const CategoryItem({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

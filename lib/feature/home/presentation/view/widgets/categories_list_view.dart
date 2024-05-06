import 'package:Ecommerce/core/model/category_model.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/category_item.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(CategoryView(category: allCategories[index]));
            },
            child: CategoryItem(categoryName: allCategories[index]),
          );
        },
      ),
    );
  }
}

import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/favorite/presentation/view/widget/favorite_product_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
          size: 30,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Favorite",
            style: TextStyle(
              fontSize: 23,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: const FavoriteProductGridView(),
          ),
        ],
      ),
    );
  }
}

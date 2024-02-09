import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/core/widgets/custom_appbar.dart';
import 'package:Ecommerce/feature/favorite/presentation/view/widget/favorite_product_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            leftOnPressed: () {},
            rightOnPressed: () {},
            rightIcon: Icons.favorite_border,
            color: AppColors.primaryColor,
            title: "Favorite",
            leftIcon: Icons.keyboard_arrow_left_outlined,
          ),
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

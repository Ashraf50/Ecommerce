import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/custom_appbar.dart';
import 'package:Ecommerce/feature/details/presentation/view/widgets/item_bottom_navbar.dart';
import 'package:Ecommerce/feature/details/presentation/view/widgets/product_images_list_view.dart';
import 'package:Ecommerce/feature/details/presentation/view/widgets/rating_widget.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final ProductModel product;
  const DetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var favCubit = FavoriteCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          CustomAppBar(
            title: "Product",
            leftIcon: Icons.keyboard_arrow_left,
            rightIcon: Icons.favorite,
            color: Colors.red,
            leftOnPressed: () {
              Navigator.pop(context);
            },
            rightOnPressed: () {
              favCubit.add(product);
            },
          ),
          ProductImages(product: product),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.title!,
                      style: const TextStyle(
                        fontSize: 28,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                RatingView(
                  model: product,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Category: ${product.category!}",
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SelectableText(
                    product.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(model: product),
    );
  }
}

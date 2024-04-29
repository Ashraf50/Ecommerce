import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/custom_appbar.dart';
import 'package:Ecommerce/feature/details/presentation/view/widgets/item_bottom_navbar.dart';
import 'package:Ecommerce/feature/details/presentation/view/widgets/rating_widget.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:Ecommerce/core/widgets/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  ProductModel product;

  DetailsView({super.key, required this.product});

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
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                Get.to(PhotoViewer(image: product.image));
              },
              child: Image.network(
                product.image,
                height: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 40),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.title,
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
                  height: 10,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColors.primaryColor,
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

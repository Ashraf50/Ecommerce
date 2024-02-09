import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  final ProductModel model;
  const ItemBottomNavBar({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 73,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${model.price}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.primaryColor,
              ),
            ),
            onPressed: () {
              cubit.add(model);
            },
            icon: const Icon(
              CupertinoIcons.cart_badge_plus,
              color: AppColors.white,
            ),
            label: const Text(
              "Add to Cart",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

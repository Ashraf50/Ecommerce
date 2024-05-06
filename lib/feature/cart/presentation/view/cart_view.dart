import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/cart_bottom_navbar.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/cart_items_sample.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/coupon_code.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
            "Cart",
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
            child: const Column(
              children: [
                CartItemListView(),
                CouponCode(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}

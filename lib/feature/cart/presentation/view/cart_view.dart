import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/core/widgets/custom_appbar.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/cart_bottom_navbar.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/cart_items_sample.dart';
import 'package:Ecommerce/feature/cart/presentation/view/widgets/coupon_code.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: "Cart",
            leftIcon: Icons.keyboard_arrow_left,
            rightIcon: Icons.more_vert,
            color: AppColors.primaryColor,
            leftOnPressed: () {
              Navigator.pop(context);
            },
            rightOnPressed: () {},
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

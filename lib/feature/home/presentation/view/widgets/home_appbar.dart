import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_state.dart';
import 'package:Ecommerce/feature/cart/presentation/view/cart_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(25),
          color: Colors.white,
          child: Row(children: [
            const Icon(Icons.sort, size: 30),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "DP Shop",
              style: TextStyle(
                  fontSize: 23,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            badges.Badge(
              badgeContent: Text(
                cubit.selectedProduct.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(5),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => const CartView());
                },
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}

import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total : ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    "\$ ${cubit.price}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              CustomButton(
                onTap: () {},
                title: "Check Out",
              )
            ],
          ),
        );
      },
    );
  }
}

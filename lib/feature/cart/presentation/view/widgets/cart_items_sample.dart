import 'package:Ecommerce/feature/cart/presentation/view/widgets/cart_item.dart';
import 'package:Ecommerce/feature/details/presentation/view/item_details.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.selectedProduct.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() =>
                  DetailsView(product: cubit.selectedProduct[index]),
                );
              },
              child: CartItem(
                product: cubit.selectedProduct[index],
              ),
            );
          },
        );
      },
    );
  }
}

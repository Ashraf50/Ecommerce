import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/extract_word.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            activeColor: AppColors.primaryColor,
            onChanged: (index) {},
          ),
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(right: 5),
            child: Image.network(product.image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  extractFirstThreeWords(product.title.toString()),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primaryColor),
                ),
                Text(
                  "\$ ${product.price.toString()}",
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: IconButton(
              onPressed: () {
                cubit.delete(product);
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
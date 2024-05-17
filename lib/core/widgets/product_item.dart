import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Widget icon;
  final Function() onPressed;
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "-${product.discountPercentage} %",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(onPressed: onPressed, icon: icon),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                product.thumbnail!,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              maxLines: 2,
              product.title!,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.add(product);
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

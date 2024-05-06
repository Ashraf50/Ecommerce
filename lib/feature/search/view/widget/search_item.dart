import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final ProductModel product;
  const SearchItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
              child: Image.network(product.images![0]),
            ),
            Expanded(
              child: Text(
                (product.title!),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

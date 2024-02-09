import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Add Coupon Code",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

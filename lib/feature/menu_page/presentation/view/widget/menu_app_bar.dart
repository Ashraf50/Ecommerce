import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuAppBar extends StatelessWidget {
  final String title;
  const MenuAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 23,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

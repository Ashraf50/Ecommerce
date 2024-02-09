import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  Function() leftOnPressed;
  Function() rightOnPressed;
  final IconData rightIcon;
  final IconData leftIcon;
  final Color color;

  final String title;
  CustomAppBar({
    super.key,
    required this.leftOnPressed,
    required this.rightOnPressed,
    required this.rightIcon,
    required this.title,
    required this.leftIcon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: leftOnPressed,
            icon: Icon(
              leftIcon,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: rightOnPressed,
            icon: Icon(
              rightIcon,
              color: color,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  const CustomWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo.png",
          height: 80,
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: "DancingScript",
            ),
          ),
        ),
      ],
    );
  }
}

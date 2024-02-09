import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  const TextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

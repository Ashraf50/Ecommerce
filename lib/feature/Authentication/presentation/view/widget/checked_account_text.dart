import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class CheckedAccount extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onTap;
  const CheckedAccount({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 11,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

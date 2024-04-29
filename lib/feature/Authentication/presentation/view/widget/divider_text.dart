import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.purple[900],
          ),
        ),
        const Text(
          "or continue with",
          style: Style.textStyle14,
        ),
        Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.purple[900],
          ),
        ),
      ],
    );
  }
}

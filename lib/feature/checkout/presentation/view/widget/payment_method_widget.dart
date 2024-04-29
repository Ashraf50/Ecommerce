import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String image;
  final bool isActive;
  const PaymentMethodWidget({
    super.key,
    required this.image,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: isActive ? const Color(0xff34A853) : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(12)),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xff34A853) : Colors.grey,
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

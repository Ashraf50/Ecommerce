import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:flutter/material.dart';


class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    required this.controller,
    this.autovalidateMode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: validator,
        autovalidateMode: autovalidateMode,
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        style: Style.textStyle16,
        decoration: InputDecoration(
          errorStyle: Style.textStyle13,
          hintText: hintText,
          labelStyle: Style.textStyle16,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.red),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

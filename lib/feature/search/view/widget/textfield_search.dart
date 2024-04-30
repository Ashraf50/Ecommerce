
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  const TextFieldSearch({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 55,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            style: Style.textStyle18,
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search here...",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.primaryColor,
                size: 30,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              // border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

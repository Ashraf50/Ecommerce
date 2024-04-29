import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: 50,
            width: 280,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "search here ... ",
              ),
            ),
          ),
          const Icon(
            Icons.camera_alt,
            size: 27,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(150, 158, 158, 158),
              highlightColor: AppColors.secondaryColor,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingView extends StatelessWidget {
  final ProductModel model;
  const RatingView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    late double rate;
    if (model.rating! > 4.5) {
      rate = 5.0;
    } else if (model.rating! > 3.5) {
      rate = 4.0;
    } else if (model.rating! > 2.5) {
      rate = 3.0;
    } else if (model.rating! > 1.5) {
      rate = 2;
    } else {
      rate = 1;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rating: ${model.rating!}",
          style: const TextStyle(
            fontSize: 22,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        RatingBar.builder(
          initialRating: rate,
          minRating: 1,
          direction: Axis.horizontal,
          itemSize: 20,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4),
          itemBuilder: (context, _) => const Icon(
            Icons.favorite,
            color: AppColors.primaryColor,
          ),
          onRatingUpdate: (index) {},
        ),
      ],
    );
  }
}

import 'package:Ecommerce/core/model/product_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/photo_view.dart';

class ProductImages extends StatelessWidget {
  final ProductModel product;
  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width * .4,
      child: Swiper(
        autoplay: true,
        itemCount: product.images!.length,
        scrollDirection: Axis.horizontal,
        pagination: const SwiperPagination(alignment: Alignment.bottomCenter),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.to(() => PhotoViewer(image: product.images![index]));
              },
              child: Image.network(
                product.images![index],
              ),
            ),
          );
        },
      ),
    );
  }
}

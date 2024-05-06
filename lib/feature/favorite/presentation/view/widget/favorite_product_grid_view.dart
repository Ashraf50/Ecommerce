import 'package:Ecommerce/feature/details/presentation/view/details_view.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_state.dart';
import 'package:Ecommerce/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class FavoriteProductGridView extends StatelessWidget {
  const FavoriteProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.selectedProduct.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailsView(product: cubit.selectedProduct[index]),
                );
              },
              child: ProductItem(
                  onPressed: () {
                    cubit.delete(cubit.selectedProduct[index]);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  product: cubit.selectedProduct[index]),
            );
          },
        );
      },
    );
  }
}

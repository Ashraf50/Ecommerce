import 'package:Ecommerce/core/widgets/shimmer_loading.dart';
import 'package:Ecommerce/feature/details/presentation/view/item_details.dart';
import 'package:Ecommerce/core/widgets/product_item.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_state.dart';
import 'package:Ecommerce/feature/home/presentation/view_model/all_product_cubit/fetch_all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var favCubit = FavoriteCubit.get(context);
        return BlocBuilder<FetchAllProductsCubit, FetchAllProductsState>(
          builder: (context, state) {
            if (state is FetchAllProductsSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailsView(product: state.products[index]),
                      );
                    },
                    child: ProductItem(
                      onPressed: () {
                        if (favCubit.isSelected(state.products[index])) {
                          favCubit.delete(state.products[index]);
                        } else {
                          favCubit.add(state.products[index]);
                        }
                      },
                      icon: Icon(
                        favCubit.isSelected(state.products[index])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      product: state.products[index],
                    ),
                  );
                },
              );
              // }
            } else if (state is FetchAllProductsFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Loading();
            }
          },
        );
      },
    );
  }
}

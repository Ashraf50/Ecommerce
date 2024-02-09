import 'package:Ecommerce/core/model/category_model.dart';
import 'package:Ecommerce/core/utils/api_services.dart';
import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/core/widgets/product_item.dart';
import 'package:Ecommerce/core/widgets/shimmer_loading.dart';
import 'package:Ecommerce/feature/details/presentation/view/item_details.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_state.dart';
import 'package:Ecommerce/feature/home/data/repos/home_repo_impl.dart';
import 'package:Ecommerce/feature/home/presentation/view_model/all_category_cubit/fetch_all_category_cubit.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/menu_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel category;
  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          MenuAppBar(
            title: category.categoryName,
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              var favCubit = FavoriteCubit.get(context);
              return BlocProvider(
                create: (context) => FetchAllCategoryCubit(
                    HomeRepoImpl(ApiServices(Dio())), category)
                  ..fetchAllCategory(),
                child:
                    BlocBuilder<FetchAllCategoryCubit, FetchAllCategoryState>(
                  builder: (context, state) {
                    if (state is FetchAllCategorySuccess) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.68,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(DetailsView(
                                    product: state.products[index]));
                              },
                              child: ProductItem(
                                onPressed: () {
                                  if (favCubit
                                      .isSelected(state.products[index])) {
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
                          });
                    } else if (state is FetchAllCategoryFailure) {
                      return Center(
                        child: Text(state.errMessage),
                      );
                    } else {
                      return const Loading();
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

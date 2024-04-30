import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/home/presentation/view_model/all_product_cubit/fetch_all_products_cubit.dart';
import 'package:Ecommerce/feature/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BlocBuilder<FetchAllProductsCubit, FetchAllProductsState>(
              builder: (context, state) {
                if (state is FetchAllProductsSuccess) {
                  return SearchView(
                    product: state.products,
                  );
                }
                return const SearchView(
                  product: [],
                );
              },
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: Text("Search here...")),
              Icon(
                Icons.camera_alt,
                size: 27,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

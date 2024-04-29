import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/products_grid_view.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/categories_list_view.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/home_appbar.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/search_widget.dart';
import 'package:Ecommerce/feature/home/presentation/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeAppBar(),
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: const Column(
              children: [
                SearchWidget(),
                TextWidget(title: "Categories"),
                CategoriesListView(),
                TextWidget(title: "Best Selling"),
                ProductsListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

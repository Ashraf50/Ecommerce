import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/feature/details/presentation/view/item_details.dart';
import 'package:Ecommerce/feature/search/view/widget/search_item.dart';
import 'package:Ecommerce/feature/search/view/widget/textfield_search.dart';
import 'package:Ecommerce/feature/search/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  final List<ProductModel> product;
  const SearchView({
    super.key,
    required this.product,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();
  List<ProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, List<ProductModel>>(
      listener: (context, state) {},
      builder: (context, search) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                TextFieldSearch(
                    searchController: searchController,
                    onChanged: (value) {
                      return searchSurahAr(value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => DetailsView(
                              product: filteredProducts[index],
                            ),
                          );
                        },
                        child: SearchItem(
                          product: filteredProducts[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void searchSurahAr(String query) {
    setState(() {
      filteredProducts = widget.product
          .where((surah) => (surah.title.toLowerCase().contains(query)))
          .toList();
    });
  }
}

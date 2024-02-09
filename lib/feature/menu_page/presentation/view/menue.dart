import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_in_view.dart';
import 'package:Ecommerce/feature/cart/presentation/view/cart_view.dart';
import 'package:Ecommerce/feature/favorite/presentation/view/favorite_view.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/custom_list_tile.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/custom_photo.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/menu_app_bar.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view_model/cubit/image_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ImageCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: ListView(
        children: [
          const MenuAppBar(title: "Profile"),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomPhoto(),
                const SizedBox(
                  height: 7,
                ),
                Text("${cubit.userDetails!.email}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    )),
                const SizedBox(height: 10)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 15),
            child: Row(
              children: [
                Text(
                  "content",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CustomListTile(
            title: "favorite",
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Get.to(const FavoriteView());
            },
          ),
          CustomListTile(
            title: "Cart",
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Get.to(const CartView());
            },
          ),
          CustomListTile(
            title: "Settings",
            icon: const Icon(Icons.settings, color: AppColors.primaryColor),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 15),
            child: Row(
              children: [
                Text(
                  "preferences",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CustomListTile(
            title: "Sign out",
            icon: const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(const SignInView());
            },
          ),
        ],
      ),
    );
  }
}

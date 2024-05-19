import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/bottom_bar.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_in_view.dart';
import 'package:Ecommerce/feature/cart/presentation/view/cart_view.dart';
import 'package:Ecommerce/feature/favorite/presentation/view/favorite_view.dart';
import 'package:Ecommerce/feature/home/presentation/view/home_view.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/custom_list_tile.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/custom_photo.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view_model/cubit/image_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdaptiveUi extends StatelessWidget {
  const AdaptiveUi({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return const BottomBar();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          LeftHand(),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: HomeView(),
          ),
        ],
      ),
    );
  }
}

class LeftHand extends StatelessWidget {
  const LeftHand({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = ImageCubit.get(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .2,
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPhoto(),
              const SizedBox(
                height: 7,
              ),
              Text(
                "${cubit.userDetails!.email}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10)
            ],
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
              Get.to(() => const FavoriteView());
            },
          ),
          CustomListTile(
            title: "Cart",
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Get.to(() => const CartView());
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
              Get.to(() => const SignInView());
            },
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names
import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/feature/cart/presentation/view/cart_view.dart';
import 'package:Ecommerce/feature/favorite/presentation/view/favorite_view.dart';
import 'package:Ecommerce/feature/home/presentation/view/home_view.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/menue.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  change_item(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  List pages = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const MenuView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(CupertinoIcons.cart_fill, size: 30, color: Colors.white),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.list, size: 30, color: Colors.white),
        ],
        height: 50,
        backgroundColor: Colors.transparent,
        color: AppColors.primaryColor,
        index: currentIndex,
        onTap: change_item,
      ),
    );
  }
}

import 'package:Ecommerce/core/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomBar(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        'assets/logo3.json',
        height: 250,
      )),
    );
  }
}

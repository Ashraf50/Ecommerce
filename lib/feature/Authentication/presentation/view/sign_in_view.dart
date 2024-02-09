import 'package:Ecommerce/feature/Authentication/presentation/view/widget/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}

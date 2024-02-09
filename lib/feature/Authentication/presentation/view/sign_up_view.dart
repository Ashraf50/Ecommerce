import 'package:Ecommerce/feature/Authentication/presentation/view/widget/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

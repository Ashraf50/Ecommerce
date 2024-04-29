import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_in_view.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/checked_account_text.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/custom_textfield.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../view_model/auth_bloc/auth_bloc.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    bool isLoading = false;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          isLoading = true;
        } else if (state is ResetSuccess) {
          Get.to(() => const SignInView());
          showSnackBar(context, "Check your email");
          isLoading = false;
        } else if (state is ResetFailure) {
          isLoading = false;
          showSnackBar(context, state.messageError);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const CustomWidget(title: "Forget Password"),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextfield(
                      hintText: "Enter Your Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    CustomButton(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          ResetEvent(
                            email: emailController.text,
                          ),
                        );
                      },
                      title: "Reset",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CheckedAccount(
                      title: "Remember Password?",
                      buttonTitle: "SignIn",
                      onTap: () {
                        Get.to(
                          () => const SignInView(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

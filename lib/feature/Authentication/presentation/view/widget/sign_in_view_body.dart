import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/bottom_bar.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/forget_password_view.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_up_view.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/checked_account_text.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/custom_textfield.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/custom_widget.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/divider_text.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/google_button.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});
  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Get.to(() => const BottomBar());
          showSnackBar(context, "Welcome");
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.message);
          print(state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const CustomWidget(title: "Login"),
                      const SizedBox(
                        height: 58,
                      ),
                      CustomTextfield(
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? "Enter a valid email"
                              : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: "Enter Your Email",
                        obscureText: false,
                        controller: emailController,
                      ),
                      CustomTextfield(
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Your password is too short!";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: "Enter Your Password",
                        obscureText: visibility,
                        controller: passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (visibility == true) {
                                visibility = false;
                              } else {
                                visibility = true;
                              }
                            });
                          },
                          icon: visibility
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              // ignore: dead_code
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => const ForgetPasswordView(),
                              );
                            },
                            child: const Text(
                              textAlign: TextAlign.end,
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          } else {
                            showSnackBar(
                                context, "check the email or password");
                          }
                        },
                        title: "Sign In",
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      const DividerText(),
                      const SizedBox(
                        height: 32,
                      ),
                      const GoogleButton(),
                      const SizedBox(
                        height: 20,
                      ),
                      CheckedAccount(
                        title: "Don’t have an account?",
                        buttonTitle: "Sign Up",
                        onTap: () {
                          Get.to(
                            () => const SignUpView(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

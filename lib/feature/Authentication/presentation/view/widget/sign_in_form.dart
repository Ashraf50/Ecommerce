import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/custom_textfield.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/data/auth_bloc/auth_bloc.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_up_view.dart';
import 'package:Ecommerce/feature/splash/splash_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          const CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (state is LoginSuccess) {
          Get.to(const SplashView());
        } else if (state is LoginFailure) {
          showSnackBar(context, state.message);
        }
      },
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CustomTextfield(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter your email"
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Your Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              CustomTextfield(
                validator: (value) {
                  return value!.length < 6 ? "Enter your password" : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              CustomButton(
                  title: "SignIn",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    } else {
                      showSnackBar(context, "Check the email & password");
                    }
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "don't have an account?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                        child: const Text("signUp",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                        onPressed: () {
                          Get.to(const SignUpView());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

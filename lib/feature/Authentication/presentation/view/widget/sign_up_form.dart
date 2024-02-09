import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/custom_textfield.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/data/auth_bloc/auth_bloc.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/sign_in_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RegisterSuccess) {
          Get.to(const SignInView());
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.messageError);
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              CustomTextfield(
                validator: (p0) {
                  return null;
                },
                autovalidateMode: AutovalidateMode.disabled,
                hintText: 'Name',
                controller: userNameController,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              CustomTextfield(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email"
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
                  return value!.length < 6
                      ? "Enter at least 6 character"
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              CustomButton(
                  title: "SignUp",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
                        userName: userNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    } else {
                      showSnackBar(context, "check the email or password");
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "already have an account?",
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
                        Get.to(const SignInView());
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

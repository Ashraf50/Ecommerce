import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:Ecommerce/core/widgets/bottom_bar.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is GooglSIgnLoading) {
          isLoading = true;
        } else if (state is GooglSIgnSuccess) {
          Get.to(() => const BottomBar());
          isLoading = false;
        } else if (state is GooglSIgnFailure) {
          isLoading = false;
          showSnackBar(context, state.messageError);
        }
      },
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(
              GoogleSignEvent(),
            );
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: isLoading
                ? const SpinKitWave(
                    color: AppColors.primaryColor,
                    size: 20.0,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        width: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Sign with google",
                        style: Style.textStyle16,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

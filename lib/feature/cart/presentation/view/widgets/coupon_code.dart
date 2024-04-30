import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/constant/text_style.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/show_snack_bar.dart';
import 'package:Ecommerce/feature/Authentication/presentation/view/widget/custom_textfield.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter/material.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDiscountDialog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Add Coupon Code",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final couponController = TextEditingController();
final formKey = GlobalKey<FormState>();
showDiscountDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "Add Coupon",
        textAlign: TextAlign.center,
        style: Style.textStyle16,
      ),
      alignment: Alignment.center,
      content: SizedBox(
        height: 190,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  validator: (value) {
                    if (couponController.text != "102003") {
                      return "Invalid Coupon!";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: "write coupon",
                  obscureText: false,
                  controller: couponController,
                ),
                CustomButton(
                    title: "Apply",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        var cubit = CartCubit.get(context);
                        cubit.discountActivated = true;
                        showSnackBar(
                          context,
                          "Discount Activated",
                        );
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    ),
  );
}

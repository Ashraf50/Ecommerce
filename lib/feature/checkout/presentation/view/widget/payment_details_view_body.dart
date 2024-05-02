import 'package:Ecommerce/core/constant/colors.dart';
import 'package:Ecommerce/core/widgets/custom_appbar.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/feature/checkout/presentation/view/thank_you_view.dart';
import 'package:Ecommerce/feature/checkout/presentation/view/widget/credit_card.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            CustomAppBar(
              leftOnPressed: () {
                Navigator.pop(context);
              },
              rightOnPressed: () {},
              title: "Payment Details",
              leftIcon: Icons.arrow_back,
              color: AppColors.primaryColor,
              rightIcon: Icons.credit_card,
            ),
            const CustomCreditCard(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomButton(
                title: "Pay",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

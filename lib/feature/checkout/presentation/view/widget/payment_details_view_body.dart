import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/feature/checkout/presentation/view/thank_you_view.dart';
import 'package:Ecommerce/feature/checkout/presentation/view/widget/credit_card.dart';
import 'package:Ecommerce/feature/checkout/presentation/view/widget/payment_listview.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Payment Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodListView(),
              const SizedBox(
                height: 20,
              ),
              const CustomCreditCard(),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Pay",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

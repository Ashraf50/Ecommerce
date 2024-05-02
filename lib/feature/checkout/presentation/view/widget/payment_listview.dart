import "dart:developer";
import "package:Ecommerce/core/constant/paypal_key.dart";
import "package:Ecommerce/core/widgets/custom_button.dart";
import "package:Ecommerce/core/widgets/show_snack_bar.dart";
import "package:Ecommerce/feature/checkout/data/model/amount_model/amount_model.dart";
import "package:Ecommerce/feature/checkout/data/model/amount_model/details.dart";
import "package:Ecommerce/feature/checkout/data/model/item_list_model/order_item_model.dart";
import "package:Ecommerce/feature/checkout/data/model/item_list_model/order_list.dart";
import "package:Ecommerce/feature/checkout/presentation/view/payment_details_view.dart";
import "package:Ecommerce/feature/checkout/presentation/view/widget/payment_method_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_paypal_payment/flutter_paypal_payment.dart";
import "package:get/get.dart";

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  List<String> images = [
    "assets/credit_card.svg",
    "assets/paypal.svg",
  ];
  int activeInd = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 13, right: 13),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 62,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      activeInd = index;
                      setState(() {});
                    },
                    child: PaymentMethodWidget(
                      image: images[index],
                      isActive: activeInd == index,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: "Continue",
            onTap: () {
              activeInd == 0
                  ? Get.to(() => const PaymentDetailsView())
                  : executePaypalMethod(context);
            },
          )
        ],
      ),
    );
  }

  void executePaypalMethod(BuildContext context) {
    var transaction = getTransactionData();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: PaypalKey.clientId,
        secretKey: PaypalKey.secretKey,
        transactions: [
          {
            "amount": transaction.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transaction.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          showSnackBar(context, "Canceled");
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, OrdersList itemList}) getTransactionData() {
    // var cubit = CartCubit();
    var amount = AmountModel(
      currency: "USD",
      total: "100",
      details: Details(
        shipping: "",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 12,
      ),
    ];
    var itemList = OrdersList(items: orders);
    return (amount: amount, itemList: itemList);
  }
}

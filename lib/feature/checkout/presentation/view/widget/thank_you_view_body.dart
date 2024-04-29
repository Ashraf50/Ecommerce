import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formatDate = DateFormat('dd/MM/yyyy').format(date);
    String time = DateFormat('h:mm').format(date);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
        )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffededed),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50 + 16, left: 20, right: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Thank You!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Your transaction was successful",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PaymentInfo(
                        title: "Date",
                        subTitle: formatDate,
                      ),
                      PaymentInfo(
                        title: "Time",
                        subTitle: time,
                      ),
                      const PaymentInfo(
                        title: "To",
                        subTitle: "Ashraf Essam",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(height: 10),
                      const SizedBox(
                        height: 15,
                      ),
                      // const TotalPrice(
                      //   title: "Total",
                      //   price: 50.97,
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TypeCardWidget(),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code_2_rounded,
                            size: 100,
                          ),
                          const SizedBox(width: 50),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "PAID",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: -40,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xffd9d9d9),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  const PaymentInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class TypeCardWidget extends StatelessWidget {
  const TypeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Row(
          children: [
            SvgPicture.asset("assets/img/logo.svg"),
            const SizedBox(
              width: 10,
            ),
            const Text("Credit Card\nMastercard **78")
          ],
        ),
      ),
    );
  }
}

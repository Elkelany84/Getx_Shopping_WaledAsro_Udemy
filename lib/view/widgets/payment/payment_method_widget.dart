import 'package:flutter/material.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: "PayPal",
              image: "assets/images/paypal.png",
              scale: 0.7,
              value: 1,
              onChange: (value) {
                setState(() {
                  radioPaymentIndex = value;
                });
              }),
          SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: "GooglePay",
              image: "assets/images/google.png",
              scale: 0.8,
              value: 2,
              onChange: (value) {
                setState(() {
                  radioPaymentIndex = value;
                });
              }),
          SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: "Credit",
              image: "assets/images/credit.png",
              scale: 0.7,
              value: 3,
              onChange: (value) {
                setState(() {
                  radioPaymentIndex = value;
                });
              }),
        ],
      ),
    );
  }

  Widget buildRadioPayment(
      {required String image,
      required double scale,
      required String name,
      required int value,
      required Function onChange}) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              SizedBox(
                width: 10,
              ),
              TextUtils(
                  text: name,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
          Radio(
              value: value,
              groupValue: radioPaymentIndex,
              fillColor: MaterialStateColor.resolveWith((states) => mainColor),
              onChanged: (value) {
                onChange(value);
              })
        ],
      ),
    );
  }
}

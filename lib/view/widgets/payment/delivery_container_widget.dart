import 'package:flutter/material.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  bool changeColors = false;
  int radioContainerIndes = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: "29 Elfardous st",
            name: "Elkelnay",
            phone: "010",
            title: "Elkelany Store",
            color: changeColors ? Colors.white : Colors.grey.shade300,
            value: 1,
            onChanged: (value) {
              setState(() {
                changeColors = !changeColors;
                radioContainerIndes = value!;
              });
            }),
        SizedBox(
          height: 10,
        ),
        buildRadioContainer(
            address: "29 Elfardous st",
            name: "Elkelnay",
            phone: "012",
            title: "Delivery",
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            value: 2,
            onChanged: (value) {
              setState(() {
                changeColors = !changeColors;
                radioContainerIndes = value!;
              });
            })
      ],
    );
  }

  buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndes,
            onChanged: (value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: name,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: phone,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    underLine: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: address,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    underLine: TextDecoration.none),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

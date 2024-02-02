import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/payment_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  final PaymentController controller = Get.find<PaymentController>();
  final AuthController authController = Get.find<AuthController>();
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
            icon: Container(),
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
        Obx(() {
          return buildRadioContainer(
              address: controller.address.value,
              name: authController.displayUserName.value,
              phone: controller.phoneNumber.value,
              title: "Delivery",
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter Your Phone Number",
                    titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: "Cancel",
                    cancelTextColor: Colors.black,
                    textConfirm: "Save",
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value = phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 11,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.1)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  size: 20,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              color: changeColors ? Colors.grey.shade300 : Colors.white,
              value: 2,
              onChanged: (value) {
                setState(() {
                  changeColors = !changeColors;
                  radioContainerIndes = value!;
                });
                controller.updatePosition();
              });
        }),
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
    required Widget icon,
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
                Row(
                  children: [
                    Text("🇪🇬+02 "),
                    TextUtils(
                        text: phone,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  address,
                  // maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

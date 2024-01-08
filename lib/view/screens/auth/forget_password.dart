import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/auth_button.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/auth_text_form_field.dart';

class ForgetpasswordScreen extends StatelessWidget {
  ForgetpasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          title: Text(
            "Forget Password",
            style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If You want to Recover Your Accoun , Then Please Provide Your Email ID Below...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 250,
                  ),
                  SizedBox(height: 50),
                  AuthTextFormField(
                    prefixIcon: Get.isDarkMode
                        ? Image.asset("assets/images/email.png")
                        : Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    suffixIcon: Text(""),
                    controller: emailControler,
                    hintText: "Email",
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationEmail).hasMatch(value)) {
                        return "Enter Valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        text: "Send",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {}
                          controller.resetPassword(emailControler.text.trim());
                        });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

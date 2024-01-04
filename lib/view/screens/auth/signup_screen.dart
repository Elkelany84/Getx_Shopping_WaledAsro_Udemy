import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/auth_button.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/auth_text_form_field.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/check_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/container_under.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(right: 25, left: 25, top: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              text: "SIGN",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              text: "UP",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        prefixIcon: Get.isDarkMode
                            ? Image.asset("assets/images/user.png")
                            : Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: Text(""),
                        controller: nameControler,
                        hintText: "User Name",
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "Enter Valid Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        height: 20,
                      ),
                      AuthTextFormField(
                        prefixIcon: Get.isDarkMode
                            ? Image.asset("assets/images/lock.png")
                            : Icon(
                                Icons.password,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: Text(""),
                        controller: passwordControler,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return "Password should be more than 5 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        text: "Sign Up",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Already Have an Account? ",
              textType: "Log In",
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}

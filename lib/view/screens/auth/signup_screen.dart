import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
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
  // final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underLine: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
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
                                  color: Get.isDarkMode ? pinkClr : mainColor,
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
                                  color: Get.isDarkMode ? pinkClr : mainColor,
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
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            prefixIcon: Get.isDarkMode
                                ? Image.asset("assets/images/lock.png")
                                : Icon(
                                    Icons.password,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            controller: passwordControler,
                            hintText: "Password",
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password should be more than 5 characters";
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                        SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "Sign Up",
                            onPressed: () async {
                              if (controller.isChecked == false) {
                                Get.snackbar("CheckBox",
                                    "Please Check Terms & Conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (formKey.currentState!.validate()) {
                                controller.signUpUsingFirebase(
                                    email: emailControler.text.trim(),
                                    password: passwordControler.text,
                                    name: nameControler.text.trim());
                                controller.isChecked = true;
                              }
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Already Have an Account? ",
                textType: "Log In",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

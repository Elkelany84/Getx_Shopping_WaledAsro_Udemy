import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/auth_button.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/auth_text_form_field.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/container_under.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  // final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();

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
                                text: "Log",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underLine: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: "In",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgetPasswordScreen);
                              },
                              child: TextUtils(
                                text: "Forget Password ?",
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underLine: TextDecoration.none,
                              )),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "Log IN",
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                controller.logInUsingFirebase(
                                    email: emailControler.text.trim(),
                                    password: passwordControler.text);
                              }
                            },
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            text: "OR",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underLine: TextDecoration.none),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/facebook.png")),
                            SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                  onTap: () async {
                                    controller.googleSignUpApp();
                                  },
                                  child:
                                      Image.asset("assets/images/google.png"));
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't Have an Account? ",
                textType: "Sign Up",
                onPressed: () {
                  Get.offNamed(Routes.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

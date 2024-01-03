import 'package:flutter/material.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/auth_button.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/auth_text_form_field.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/check_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/auth/container_under.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(right: 25, left: 25, top: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                            text: "SIGN",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                            underLine: TextDecoration.none),
                        SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                            text: "UP",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            underLine: TextDecoration.none),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      prefixIcon: Image.asset("assets/images/user.png"),
                      suffixIcon: Text(""),
                      controller: nameControler,
                      hintText: "User Name",
                      obscureText: false,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                      prefixIcon: Image.asset("assets/images/email.png"),
                      suffixIcon: Text(""),
                      controller: emailControler,
                      hintText: "Email",
                      obscureText: false,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AuthTextFormField(
                      prefixIcon: Image.asset("assets/images/lock.png"),
                      suffixIcon: Text(""),
                      controller: passwordControler,
                      hintText: "Password",
                      obscureText: true,
                      validator: () {},
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

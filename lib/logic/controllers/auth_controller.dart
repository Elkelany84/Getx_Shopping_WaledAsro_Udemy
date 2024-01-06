import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;
  var displayUserName = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }

  void signUpUsingFirebase(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String? title = error.code.replaceAll(RegExp("-"), " ").capitalize;
      String message = "";

      if (error.code == 'weak-password') {
        // print('The password provided is too weak.');
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      //print(e);
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {displayUserName = auth.currentUser!.displayName!});
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String? title = error.code.replaceAll(RegExp("-"), " ").capitalize;
      String message = "";
      if (error.code == 'user-not-found') {
        // print('No user found for that email.');
        message = 'No user found for that $email.';
      } else if (error.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      //print(e);
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void googleSignUpApp() {}
  void resetPassword() {}
  void signOutFromApp() {}
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;
  var displayUserName = "".obs;
  var displayUserPhoto = "".obs;
  var displayUserEmail = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  var isSignedIn = false;

  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;

    // googleSignUpApp();
    super.onInit();
  }

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
        displayUserName.value = name;
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
          .then((value) =>
              {displayUserName.value = auth.currentUser!.displayName!});
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
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

  void googleSignUpApp() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleSignIn.currentUser!.displayName!;
      displayUserPhoto.value = googleSignIn.currentUser!.photoUrl!;
      displayUserEmail.value = googleSignIn.currentUser!.email;

      //Obtain the auth details from the request
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String? title = error.code.replaceAll(RegExp("-"), " ").capitalize;
      String message = "";
      if (error.code == 'user-not-found') {
        // print('No user found for that email.');
        message = 'No user found for that $email.';
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

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = "";
      displayUserPhoto.value = "";
      displayUserEmail.value = "";
      isSignedIn = false;
      authBox.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}

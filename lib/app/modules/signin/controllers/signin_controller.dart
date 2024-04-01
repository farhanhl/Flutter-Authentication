import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;

  @override
  void onInit() {
    super.onInit();
  }

  void toggle() {
    isObsecure = !isObsecure;
    update();
  }

  doSignIn(String email, String password) async {
    if (email.isNotEmpty || password.isNotEmpty) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      update();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.offNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Notification",
            "User Not Found",
            backgroundColor: const Color(0XFFBB2124),
            colorText: const Color(0XFFFEFDED),
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "Notification",
            "Wrong Password",
            backgroundColor: const Color(0XFFBB2124),
            colorText: const Color(0XFFFEFDED),
          );
        }
      }
      EasyLoading.dismiss();
      update();
    } else {
      Get.snackbar(
        "Notification",
        "Please check the form",
        backgroundColor: const Color(0XFFBB2124),
        colorText: const Color(0XFFFEFDED),
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

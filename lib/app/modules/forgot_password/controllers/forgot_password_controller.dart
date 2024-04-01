import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void doForgotPassword(String email) async {
    if (email.isNotEmpty) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.snackbar(
          "Notification",
          "Password Reset Email has been sent",
          backgroundColor: const Color(0XFF52B963),
          colorText: const Color(0XFFFEFDED),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Notification",
            "User Not Found",
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

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}

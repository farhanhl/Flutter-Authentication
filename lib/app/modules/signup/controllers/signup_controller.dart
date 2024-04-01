import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
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

  void doSignUp(String name, String email, String password) async {
    if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      update();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.snackbar(
          "Notification",
          "Registered Successfully",
          backgroundColor: const Color(0XFF52B963),
          colorText: const Color(0XFFFEFDED),
        );
        Get.offNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            "Notification",
            "Password is too weak",
            backgroundColor: const Color(0XFFBB2124),
            colorText: const Color(0XFFFEFDED),
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            "Notification",
            "Account already exist",
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

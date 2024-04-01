import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(16.sp),
              children: [
                Lottie.asset(
                  "assets/lotties/welcome.json",
                  height: 200.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 30.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFedf0f8),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: const Color(0xFFb2b7bf),
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => controller.doForgotPassword(
                      controller.emailController.text,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF273671),
                      ),
                    ),
                    child: Text(
                      "Send Email",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: const Color(0xFF8c8e98),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.SIGNUP),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color(0xFF273671),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:firebase/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      init: SigninController(),
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
                    obscureText: controller.isObsecure,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isObsecure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF273671),
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                        splashRadius: 24.r,
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
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
                    onPressed: () => controller.doSignIn(
                      controller.emailController.text,
                      controller.passwordController.text,
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
                      "Sign In",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                  child: Text(
                    "Forgot Password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF273671),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                  "or Sign In with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF273671),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => AuthMethods().signInWithGoogle(),
                      splashFactory: NoSplash.splashFactory,
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF273671),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 50.h,
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    InkWell(
                      onTap: () => null,
                      splashFactory: NoSplash.splashFactory,
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF273671),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Image.asset(
                            "assets/images/apple.png",
                            height: 50.h,
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
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

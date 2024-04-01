import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 30.w,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF273671),
                    ),
                  ),
                  onPressed: () => Get.toNamed(Routes.PROFILE),
                  child: const Text("PROFILE"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 30.w,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF273671),
                    ),
                  ),
                  onPressed: () => controller.doSignOut(),
                  child: const Text("Sign Out"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

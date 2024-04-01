import 'package:firebase/services/auth/local_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isAuthenticated = false;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() async {
    super.onReady();
    EasyLoading.show(
      status: 'Authenticating...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    final authenticate = await LocalAuth.doAuthentication();
    if (authenticate) {
      isAuthenticated = authenticate;
      EasyLoading.showSuccess("You're Authenticated");
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError("You're not Authenticated");
      Get.back();
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}

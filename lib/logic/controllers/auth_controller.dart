import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';
import '../../utils/config.dart';

class AuthController extends GetxController {
  bool isVisibility = false;

  bool isCheckBox = false;

  bool isLoading = false;
  bool isSignIn = false;

  final GetStorage authBox= GetStorage();

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void CheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void loading(bool load) {
    isLoading = load;
    update();
  }

  void signIn()async{
  isSignIn=true;
  authBox.write("auth", isSignIn);
  }

  void signUp()async{
    isSignIn=true;
  }

  void signOut() async {
    try {
      print("${prefs.remove(userName)}");
      prefs.remove(userId);
      prefs.remove(userName);
      prefs.remove(userPhone);
      prefs.remove(userEmail);
      prefs.remove(userImage);
      prefs.clear();
      isSignIn=false;
      authBox.remove("auth");
      Get.offNamed(Routes.loginScreen);
      print("log out done ");
      Get.snackbar(
        "sign out",
        "sign out done"
        ,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

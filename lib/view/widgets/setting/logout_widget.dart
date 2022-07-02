import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../text_utils.dart';

class  LogOutWidget extends StatelessWidget {
    LogOutWidget({Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_)=>Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:() {
          Get.defaultDialog(
            title: "Logout From App".tr,
            titleStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout'.tr,
            middleTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: "No".tr,
            cancelTextColor: Colors.white,
            textConfirm: "YES".tr,
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOut();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        splashColor: Get.isDarkMode?Colors.pink:mainColor.withOpacity(0.4),
        borderRadius:BorderRadius.circular(12),
        customBorder:const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: logOutSettings ,
              ),
              child:const Icon(
                Icons.logout,
                color: Colors.white,
              ) ,
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              text: "Log Out".tr,
              fontsize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Colors.white:Colors.black,
              underline: TextDecoration.none,
            ),
          ],
        ),
      ),
    ),);
  }
}

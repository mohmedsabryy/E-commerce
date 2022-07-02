// import 'package:ecommerce/logic/controllers/auth_controller.dart';
// import 'package:ecommerce/logic/controllers/theme_controller.dart';
// import 'package:ecommerce/services/product_services.dart';
// import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/logout_widget.dart';
import '../widgets/setting/profile_widget.dart';

// import '../../routes/routes.dart';
// import '../../utils/config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           ThemeController().changesTheme();
      //         },
      //         child: Text(
      //           'Dark Mode',
      //           style: TextStyle(
      //             color: Get.isDarkMode ? Colors.white : Colors.black,
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20.0),
      //       GetBuilder<AuthController>(
      //         builder:(controller)=> Container(
      //           color: Colors.grey,
      //           child: TextButton(
      //             onPressed: () {
      //               Get.defaultDialog(
      //                 title: "Logout",
      //                 titleStyle: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                 ),
      //                 middleText: " are you sure you need to logout ? ",
      //                 middleTextStyle: TextStyle(
      //                   fontSize: 16,
      //                   color: Colors.black,
      //                 ),
      //                 radius: 10,
      //                 textCancel: " No ",
      //                 textConfirm: " Yes ",
      //                 cancelTextColor: Colors.black,
      //                 confirmTextColor: Colors.black,
      //                 onCancel: (){
      //                   Get.back();
      //                 },
      //                 onConfirm: (){
      //                   controller.signOut();
      //                 },
      //                 buttonColor: Get.isDarkMode? pinkClr:mainColor,
      //               );
      //             },
      //             child: Text(
      //               'Log out',
      //               style: TextStyle(
      //                 color: Get.isDarkMode ? Colors.white : Colors.black,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20.0),
      //       Container(
      //         color: Colors.grey,
      //         child: TextButton(
      //           onPressed: () {
      //              ProductServices.getAllProduct();
      //           },
      //           child: Text(
      //             'test data',
      //             style: TextStyle(
      //               color: Get.isDarkMode ? Colors.white : Colors.black,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: ListView(
        padding:  EdgeInsets.all(24),
        children:  [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness:2 ,

          ),
          const SizedBox(
            height: 20,
          ),
           TextUtils(
              text: "GENERAL".tr,
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color:Get.isDarkMode?pinkClr: mainColor,
              underline: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
           DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
          const SizedBox(
            height: 20,
          ),
         // LanguageWidget(),



        ],

      ),

    );
  }
}

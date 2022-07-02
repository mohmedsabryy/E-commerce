

import 'package:ecommerce/logic/controllers/setting_controller.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../logic/controllers/theme_controller.dart';
import '../../../utils/theme.dart';

class DarkModeWidget extends StatelessWidget {
  final controller =Get.find<SettingController>();
   DarkModeWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(()=>Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children:
      [
        buildIconWidget(),
        Switch(
          activeTrackColor:Get.isDarkMode?pinkClr:mainColor ,
          activeColor: mainColor,
          value: controller.swithchValue.value,
          onChanged: (value){

            ThemeController().changesTheme();
            controller.swithchValue.value=value;


          },
        ),

      ],
    ),);
  }

  Widget buildIconWidget (){
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child:const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ) ,
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              text: "Dark Mode".tr,
              fontsize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Colors.white:Colors.black,
              underline: TextDecoration.none,
          ),
        ],
      ),
    );

  }
}

import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.CheckBox();
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,

                borderRadius: BorderRadius.circular(5),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                  ? const Icon(
                Icons.done,
                color: pinkClr,
              )
                  : Image.asset('assets/images/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10
          ),
          Row(
            children: [
              TextUtils(
                text: " I accept",
                fontsize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              TextUtils(
                text: " term & conditions",
                fontsize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}

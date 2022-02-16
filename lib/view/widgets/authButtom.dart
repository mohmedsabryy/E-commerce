import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AuthButtom extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButtom({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode?pinkClr:mainColor,
        minimumSize: const Size(360, 50),
      ),
      onPressed:onPressed,
      child:  TextUtils(
        underline: TextDecoration.none,
        color: Colors.white,
        text: text,
        fontWeight: FontWeight.bold,
        fontsize: 18,
      ),
    );
  }
}

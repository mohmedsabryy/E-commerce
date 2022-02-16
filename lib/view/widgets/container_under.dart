import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

   const ContainerUnder({
     required this.textType,
     required this.text,
     required this.onPressed,
     Key? key
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width:double.infinity ,
        height: 150,
        decoration: BoxDecoration(
            color:Get.isDarkMode? pinkClr:mainColor,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(20) ,
              topRight: Radius.circular(20) ,

            ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              text: text,
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.underline,
            ),
            TextButton(
              onPressed: onPressed,
              child: TextUtils(
                text: textType,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                underline: TextDecoration.none,
              ),
            ),
          ],

        ),



      ),
    );
  }
}

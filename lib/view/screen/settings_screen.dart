import 'package:ecommerce/logic/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
              ThemeController().changesTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: (){
                ThemeController().changesTheme();
              },
              child: Text(
                'Log out',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

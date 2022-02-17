import 'package:ecommerce/logic/controllers/theme_controller.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  void logout(){
    prefs.remove(userId);
    prefs.remove(userName);
    prefs.remove(userPhone);
    prefs.remove(userEmail);
    prefs.remove(userImage);

    prefs.clear();

    Get.offNamed(Routes.loginScreen);
    print("log out done ");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changesTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.grey,
              child: TextButton(
                onPressed: () {
                  logout();
                  //ThemeController().changesTheme();

                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.grey,
              child: TextButton(
                onPressed: () {
                   ProductServices.getAllProduct();
                },
                child: Text(
                  'test data',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

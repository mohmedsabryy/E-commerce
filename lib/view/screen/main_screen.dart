import 'package:ecommerce/logic/controllers/main_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            leading: Container(),
            actions: [
              IconButton(
                onPressed: () {

                },
                icon: Image.asset('assets/images/shop.png'),
              )
            ],
            title: Text(
              controller.title[controller.currentIndex.value],
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.currentIndex.value=index;
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ?pinkClr  : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ?pinkClr  : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ?pinkClr  : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ?pinkClr  : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children:controller.tabs.value,
          ),
        );
      }),
    );
  }
}

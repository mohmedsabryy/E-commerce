
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logic/controllers/theme_controller.dart';

void main() async{


  await GetStorage.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 // comment
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'E Commerce ',
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: AppRoutes.welcome,
      getPages:AppRoutes.routes,

    );
  }
}
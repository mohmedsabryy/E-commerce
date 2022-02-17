import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/config.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/bindings/main_binding.dart';
import 'logic/controllers/theme_controller.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  MainBinding().dependencies();
  await GetStorage.init();
  prefs =await SharedPreferences.getInstance();
  //userToken=prefs.getString(userId)!;
  //userToken =box.read(userId);
  // if the user token is null nav to login screen else nav to home screen

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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

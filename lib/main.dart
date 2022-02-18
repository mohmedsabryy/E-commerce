import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logic/bindings/main_binding.dart';
import 'logic/controllers/theme_controller.dart';

//comment
//second test
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MainBinding().dependencies();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    //var auth =GetStorage().read("auth");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce ',
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      //initialRoute: AppRoutes.welcome,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      //initialRoute:  controller.isSignIn ? AppRoutes.mainScreen:AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}

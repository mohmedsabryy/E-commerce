import 'package:ecommerce/logic/bindings/auth_binding.dart';
import 'package:ecommerce/logic/bindings/main_binding.dart';
import 'package:ecommerce/view/screen/auth/forgot_password_screen.dart';
import 'package:ecommerce/view/screen/auth/login_Screen.dart';
import 'package:ecommerce/view/screen/auth/singup_screen.dart';
import 'package:ecommerce/view/screen/favorites_screen.dart';
import 'package:ecommerce/view/screen/main_screen.dart';
import 'package:ecommerce/view/screen/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screen/cart_screen.dart';
import '../view/screen/category_screen.dart';
import '../view/screen/settings_screen.dart';

class AppRoutes{
  //initial rout
  static const welcome =Routes.welcomeScreen ;
  static const mainScreen =Routes.mainScreen ;

  //get page

  static final routes=[
    //welcome screen
    GetPage(
      name: Routes.welcomeScreen,
      page:()=> const WelcomeScreen() ,
    ),

    //login screen
    GetPage(
      name: Routes.loginScreen,
      page:()=>  LoginScreen() ,
      binding: AuthBinding(),
    ),

    //signup screen
    GetPage(
      name: Routes.signUpScreen,
      page:()=>  SignUpScreen() ,
      binding: AuthBinding(),
    ),

    //forgotPassword screen
    GetPage(
      name: Routes.forgotPassword,
      page:()=>   ForgotPassword() ,
      binding: AuthBinding(),

    ),

    //favourateScreen
    GetPage(
      name: Routes.favourateScreen,
      page:()=>   FavoritesScreen() ,
      binding: AuthBinding(),

    ),

    //mainScreen
    GetPage(
      name: Routes.mainScreen,
      page:()=>   MainScreen() ,
      bindings:[
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ] ,
    ),

    //settingScreen
    GetPage(
      name: Routes.settingScreen,
      page:()=> SettingsScreen() ,
      binding: AuthBinding(),
    ),

    //categoryScreen
    GetPage(
      name: Routes.categoryScreen,
      page:()=>   CategorySceen() ,
      binding: AuthBinding(),
    ),

    //cartScreen
    GetPage(
      name: Routes.cartScreen,
      page:()=>   CartScreen() ,
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}


class Routes{
  static const welcomeScreen ='/welcomeScreen' ;
  static const loginScreen ='/loginScreen' ;
  static const signUpScreen ='/signUpScreen' ;
  static const forgotPassword ='/forgotPassword' ;
  static const favourateScreen ='/favourateScreen' ;
  static const mainScreen ='/mainScreen' ;
  static const settingScreen ='/settingScreen' ;
  static const categoryScreen ='/categoryScreen' ;
  static const cartScreen ="/cartScreen";




}
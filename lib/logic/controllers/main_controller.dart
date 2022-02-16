import 'package:ecommerce/view/screen/category_screen.dart';
import 'package:ecommerce/view/screen/favorites_screen.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/main_screen.dart';
import 'package:ecommerce/view/screen/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController
{
  RxInt currentIndex = 0.obs;

  final tabs = [
   HomeScreen(),
    CategorySceen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title=[
    "Home",
    "Categories",
    "Favourites",
    "Settings",
  ].obs;
}
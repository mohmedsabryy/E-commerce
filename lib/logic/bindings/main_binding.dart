import 'package:ecommerce/logic/controllers/main_controller.dart';
import 'package:ecommerce/logic/controllers/payment_controller.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController(),permanent: true);

  }

}
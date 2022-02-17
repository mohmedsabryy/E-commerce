import 'dart:convert';

import 'package:ecommerce/utils/config.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';

final controller = Get.find<AuthController>();
Future<bool> userLogin(String userMail, userPass) async {
//http://192.168.1.3/ecommerce/api/users/login_user.php?user_email=ahmed@gmail.com&user_password=123456&token=m
  String url = apiPath +
      "users/login_user.php?user_email=" +
      userMail +
      "&user_password=" +
      userPass +
      "&token=" +
      token;

  http.Response response = await http.get(Uri.parse(url));
  // print response code
  print("response code => ${json.decode(response.body)["code"]}");
  if (json.decode(response.body)["code"] == "200") {
    // get the user data
    Map userData = json.decode(response.body)["message"];
    print("user data => $userData");

    // store the user data in get storage using key and value
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(userId, userData["user_id"]);
    pref.setString(userName, userData["user_name"]);
    pref.setString(userPhone, userData["user_phone"]);
    pref.setString(userEmail, userData["user_email"]);
    pref.setString(userImage, userData["user_image"]);

    // after save we navigate to the main screen (home)
   // Get.toNamed(Routes.mainScreen);
    Get.offNamed(Routes.mainScreen);
    controller.loading(false);
    print("user login success");
    return true;
  } else {
    print("user login failed");
    return false;
  }
}

// final getStorage = GetStorage();
// getStorage.write(userId, myData["user_id"]);
// getStorage.write(userName, myData["user_name"]);
// getStorage.write(userPhone, myData["user_phone"]);
// getStorage.write(userEmail, myData["user_email"]);
// getStorage.write(userImage, myData["user_image"]);

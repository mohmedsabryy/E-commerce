
import 'package:shared_preferences/shared_preferences.dart';

const String token="m";

const String ip="192.168.1.3";
const String apiPath="http://$ip/ecommerce/api/";
                    //http://192.168.1.3/ecommerce/api/

const String imagesPath="http://$ip/ecommerce/images/";

late SharedPreferences prefs;

late String userToken;

final String user_Id="";
final String user_Name="";
final String user_Phone="";
final String user_Email="";
final String user_Image="";
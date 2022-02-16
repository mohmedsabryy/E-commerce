import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screen/auth/login_Screen.dart';
import 'package:ecommerce/view/screen/auth/singup_screen.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 60,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: TextUtils(
                          color: Colors.white,
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Welcome ',
                          underline: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextUtils(
                            text: 'E Commerce',
                            fontsize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            underline: TextDecoration.none,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: TextUtils(
                              text: ' App',
                              fontsize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              underline: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 250,
                    ),


                    // buttom Get Start


                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          )),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child:  const TextUtils(
                        fontsize: 22,
                        fontWeight: FontWeight.bold,
                        text: 'Get Start',
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        // text
                        const TextUtils(
                          text: "Don't have an Account ?",
                          fontsize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 20,
                        ),



                        // Buttom  Sign Up
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child: const TextUtils(
                            text: 'Sign Up',
                            fontsize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            underline: TextDecoration.underline,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

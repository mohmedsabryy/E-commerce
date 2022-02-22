import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screen/auth/forgot_password_screen.dart';
import 'package:ecommerce/view/screen/auth/login_data.dart';
import 'package:ecommerce/view/screen/auth/singup_screen.dart';
import 'package:ecommerce/view/widgets/authButtom.dart';
import 'package:ecommerce/view/widgets/authTextFromField.dart';
import 'package:ecommerce/view/widgets/container_under.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 40, bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // // Text Sign UP
                    Row(
                      children: [
                        TextUtils(
                          text: "LOG",
                          fontsize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underline: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                          text: "IN",
                          fontsize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underline: TextDecoration.none,
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    // email
                    AuthTextFromField(
                      textStyle: TextStyle(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      controller: emailController,
                      obscureText: false,
                      prefixIcon: Get.isDarkMode
                          ? const Icon(
                              Icons.email,
                              color: pinkClr,
                              size: 30,
                            )
                          : Image.asset('assets/images/email.png'),
                      suffixIcon: const Text(''),
                      hintText: 'Email ',
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    //password
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFromField(
                        textStyle: TextStyle(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        controller: passwordController,
                        //obscureText: true,
                        obscureText: controller.isVisibility ? false : true,
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: 30,
                              )
                            : Image.asset('assets/images/lock.png'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          // icon: Icon(Icons.visibility),
                          icon: controller.isVisibility
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                        ),
                        hintText: 'Password ',

                        validator: (value) {
                          if (value.toString().length <= 5) {
                            return 'Password should be longer or equal  to 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(ForgotPassword());
                        },
                        child: TextUtils(
                          text: ' forgot Password ?',
                          fontsize: 18,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underline: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // buttom Login up
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthButtom(
                          text: "LOG IN",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.loginUsingFirebase(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 40),
                    TextUtils(
                      text: "OR",
                      fontsize: 18,
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underline: TextDecoration.none,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GetBuilder<AuthController>(
                          builder: (_) {
                            return InkWell(
                              child: Image.asset('assets/images/google.png'),
                              onTap: () {
                                controller.googleSignUp();
                              },
                            );
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ContainerUnder(
              onPressed: () {
                Get.off(SignUpScreen());
              },
              text: "Don't have an account ? ",
              textType: "Sign Up ",
            ),
          ],
        ),
      ),
    );
  }
}

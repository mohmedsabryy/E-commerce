import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/authButtom.dart';
import 'package:ecommerce/view/widgets/authTextFromField.dart';
import 'package:ecommerce/view/widgets/checkWidget.dart';
import 'package:ecommerce/view/widgets/container_under.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                    // Text Sign UP
                    Row(
                      children: [
                        TextUtils(
                          text: "SIGN",
                          fontsize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underline: TextDecoration.none,
                        ),
                        const SizedBox(width: 3),
                        TextUtils(
                          text: "UP",
                          fontsize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underline: TextDecoration.none,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    // name
                    AuthTextFromField(
                      controller: nameController,
                      obscureText: false,
                      prefixIcon: Get.isDarkMode
                          ? const Icon(
                              Icons.person,
                              color: pinkClr,
                              size: 30,
                            )
                          : Image.asset('assets/images/user.png'),
                      suffixIcon: const Text(''),
                      hintText: 'User Name ',
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value)) {
                          return "Enter Valid Name ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    // email
                    AuthTextFromField(
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
                    const SizedBox(height: 30),

                    // phone
                    AuthTextFromField(
                      controller: phoneController,
                      obscureText: false,
                      prefixIcon: const Icon(
                        Icons.phone_android_rounded,
                        color: mainColor,
                        size: 30,
                      ),
                      suffixIcon: const Text(''),
                      hintText: 'Phone ',
                      validator: (value) {
                        if (!RegExp(validationPhone).hasMatch(value)) {
                          return "Invalid Phone";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),

                    //password
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFromField(
                        controller: passwordController,
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
                          if (value.toString().length <= 6) {
                            return 'Password should be longer or equal  to 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
                    const SizedBox(height: 20),
                    CheckWidget(),
                    const SizedBox(height: 20),
                    // buttom sigin up
                    AuthButtom(
                      text: "SIGN UP",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            ContainerUnder(
              onPressed: () {
                Get.toNamed(Routes.loginScreen);
              },
              text: "Already have an Account ? ",
              textType: "Log in ",
            ),
          ],
        ),
      ),
    ));
  }
}

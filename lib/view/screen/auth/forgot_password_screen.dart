
import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/authButtom.dart';
import 'package:ecommerce/view/widgets/authTextFromField.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailController =TextEditingController() ;
  final formKey =GlobalKey<FormState>();
   ForgotPassword({Key? key}) : super(key: key);
   final controller =Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0 ,
        backgroundColor:Get.isDarkMode ? darkGreyClr:Colors.white,
        centerTitle: true ,
        title: Text(
          'Forgot Password ' ,
        style: TextStyle(
          color: Get.isDarkMode?pinkClr:mainColor,
        ),
      ),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
            color: Get.isDarkMode?Colors.white: Colors.black ,
          ),
          onPressed: (){
            Get.back() ;

          },
        ),

      ),

        body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      Get.back() ;
                    },
                    icon: Icon(
                        Icons.close_rounded,
                    color:Get.isDarkMode?Colors.white : Colors.black ,
                    ),
                  ),
                ),
                const SizedBox(height: 20,) ,
                Text(
                    'If you want to recover your account ,then please provide your email ID below...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black ,
                ),
                ),
                const SizedBox(
                  height: 50,

                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,

                ),
                const SizedBox(height: 50,),
                AuthTextFromField(
                  textStyle: TextStyle(),
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
                  validator: (value)
                  {
                    if(!RegExp(validationEmail).hasMatch(value))
                    {
                      return "Invalid Email" ;
                    }
                    else {
                      return null ;
                    }

                  },
                ) ,
                const SizedBox(height: 50,),

                GetBuilder<AuthController>(
                  builder: (_){
                    return AuthButtom(
                      text: 'SEND',
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          controller.resetPassword(email: emailController.text.trim());
                        }
                      },
                    );
                  },

                ),

              ],
            ),
          ),
        ),

      ),
    ),);
  }
}

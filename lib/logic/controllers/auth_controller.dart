
// test

import 'package:ecommerce/models/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';


class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var displayUserPhoto = ''.obs;
  bool isLoading = false;
  bool isSignIn = false;


 late UserModel user ;
 var userName=''.obs;
 var userImage='';
 var useremail;

  var defaultUserImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8czzbrLzXJ9R_uhKyMiwj1iGxKhJtH7pwlQ&usqp=CAU";

  FirebaseAuth auth = FirebaseAuth.instance;

  final GetStorage authBox = GetStorage();
  User? get userProfiloe => auth.currentUser;
@override
  void onInit() {
    // TODO: implement onInit
  displayUserName.value =
  (userProfiloe != null ? userProfiloe!.displayName : "")!;
  displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;
  displayUserPhoto.value =
  (userProfiloe != null ? userProfiloe!.photoURL : "")!;
  super.onInit();
  }
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void CheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }


  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
   // required  var phone,

  }) async {

    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        userName.value=name;
        auth.currentUser?.updateDisplayName(name);

        //auth.currentUser?.updatePhoneNumber(userPhone);
        auth.currentUser?.updatePhotoURL(defaultUserImageUrl);
        // user.id = auth.currentUser!.uid;
        // user.name = name;
        // user.email= email;
        // user.password = password;
        // user.image=defaultUserImageUrl;


      });
      isSignIn = true;
      update();
      Get.snackbar(
        "Sign Up",
        "Sign Up done successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), " ");
      String message = "";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        message = "The account already exists for that email.";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        // user.id=auth.currentUser!.uid;
         userName.value = auth.currentUser!.displayName!;
         //user.email= email;
        // user.password = password;
        // user.image = auth.currentUser!.photoURL!;
        //userPhone=auth.currentUser!.phoneNumber!;
      });
      isSignIn=true;
      authBox.write("auth", isSignIn);
      update();
      Get.snackbar(
        "Sign In",
        "Sign In done successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), " ");
      String message = "";
      if (error.code == 'user-not-found') {
        message='No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message='Wrong password provided for that user.';
      }else{
       message= error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUp() async{
    try{
      final GoogleSignInAccount? googleAccount= await GoogleSignIn().signIn();
      userName.value = googleAccount!.displayName!;
      userImage = googleAccount.photoUrl!;
   //   useremail=googleAccount?.email;
      GoogleSignInAuthentication googleSignInAuthentication=
      await googleAccount.authentication;
      final AuthCredential credential=GoogleAuthProvider.credential(
        idToken:googleSignInAuthentication.idToken,
        accessToken:googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);
      isSignIn=true;
      authBox.write("auth", isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
      Get.snackbar(
        "Sign In",
        "Sign In done successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    }catch(error){
      Get.snackbar(
        "error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({
  required String email,
}) async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      isSignIn=true;
      update();
      Get.back();
      Get.snackbar(
        "Reset password",
        "Please, Check your email to reset new password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), " ");
      String message = "";
      if (error.code == 'user-not-found') {
        message='No user found for that email.';
      } else{
        message= error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    try {

      isSignIn = false;
      authBox.remove("auth");
      await auth.signOut();
      await GoogleSignIn().signOut();
      userName.value="";
      userImage="";
      authBox.remove("auth");
      isSignIn=false;
      update();

      Get.offNamed(Routes.loginScreen);
      print("log out done ");
      Get.snackbar(
        "sign out",
        "sign out done",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

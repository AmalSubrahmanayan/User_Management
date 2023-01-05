 

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlkeyprg/view/List_Screen/list_screen.dart';
import 'package:mlkeyprg/view/Otp_Screen/otp_screen.dart';
import 'package:mlkeyprg/view/Phone_Screen/phone_scerrn.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
//email,password,name...
  late Rx<User?> _user;
  RxBool isLoading = false.obs;
  var verificationId = "".obs;
   FirebaseAuth auth = FirebaseAuth.instance;
    

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScrean);
  }

  _initialScrean(User? user) {
    if (user == null) {
      print("user not loginrd");
      Get.offAll(() => const PhoneScreen());
    } else {
      Get.offAll(() => const ListScreen());
    }
  }

  // void register(String email, String password) async {
  //   isLoading.value = true;
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     Get.snackbar(
  //       "About User",
  //       "User Message",
  //       backgroundColor: Colors.amber,
  //       snackPosition: SnackPosition.BOTTOM,
  //       titleText: const Text(
  //         "Account creation faild",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       messageText: Text(
  //         e.toString(),
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //     );
  //   }
  //   isLoading.value = false;
  //   update();
  // }

  // void login(String email, String password) async {
  //   isLoading.value = true;
  //   try {
  //     await auth.signInWithEmailAndPassword(email: email, password: password);
  //   } catch (e) {
  //     Get.snackbar(
  //       "About Login",
  //       "Login Message",
  //       backgroundColor: Colors.amber,
  //       snackPosition: SnackPosition.BOTTOM,
  //       titleText: const Text(
  //         "Account Login faild",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       messageText: Text(
  //         e.toString(),
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //     );
  //   }
  //   isLoading.value = false;
  //   update();
  // }

  void loginPhone(String phone) async {
    try {
      log("message");
      await auth.verifyPhoneNumber(
        
        phoneNumber: phone,
        verificationCompleted: (credential) async {
          await auth.signInWithCredential(credential);
          Get.off(()=>const OtpScreen());
        },
        verificationFailed: ((error) {
          if (error.code == "invalid-phone-number") {
            Get.snackbar(
              'error',
              'invalid phone number',
            );
          } else {
            Get.snackbar(
              'error',
              'some thing went ronggggg',
            );
          }
        }),
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
      //  timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Phone Login faild",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  Future<bool> otpCheck(String otp) async {
    var data = await auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp));

    return data.user != null ? true : false;
  }

  void verifyOtp(String otp) async {
    isLoading.value = true;
    var isVerifie = await otpCheck(otp);
    isVerifie ? Get.offAll(() => const ListScreen()) : Get.back();
    isLoading.value = false;
    update();
  }
 
//  void loginWithPhone(String phone) async {
//     auth.verifyPhoneNumber(
//       phoneNumber: "+91$phone",
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value) {
//           print("You are logged in successfully");
//         });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         update();
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

  // void verifyOTP(String otp) async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationID, smsCode: otp);

  //   await auth.signInWithCredential(credential).then(
  //     (value) {
        
  //         _user.value = FirebaseAuth.instance.currentUser ;
        
  //     },
  //   ).whenComplete(
  //     () {
  //       if (user != null) {
  //         Fluttertoast.showToast(
  //           msg: "You are logged in successfully",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //         Get.offAll(()=>Home());
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => Home(),
  //         //   ),
  //         // );
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: "your login is failed",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //       }
  //     },
  //   );
  // }




  void logOut() async {
    await auth.signOut();
  }
}

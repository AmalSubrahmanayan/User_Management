import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlkeyprg/constants/pallete.dart';
import 'package:mlkeyprg/controller/auth_controller.dart';
import 'package:mlkeyprg/view/Otp_Screen/otp_screen.dart'; 

import '../SignIn_Screen/widgets/gradient_button.dart';

 
class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
    
  @override
  Widget build(BuildContext context) {
    String phone;
      TextEditingController phoneController = TextEditingController();
  TextEditingController countrycode = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 50),
              const Text(
                'Phone Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              // const PhoneField(),
              const SizedBox(height: 50),
              // const LoginField(hintText: 'Phone'),
              ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 40,
              child: TextField(
                controller: countrycode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Pallete.gradient2,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              '|',
              style: TextStyle(
                fontSize: 35,
                color: Pallete.borderColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone",
                ),
              ),
            )
          ],
        ),
      ),
    ),
// ElevatedButton(onPressed: () => Get.off(() => const OtpScreen()), child: const Text('Phone')),
              const SizedBox(height: 50),
              GradientButton(
                onTap: ()   {
               AuthController.instance.loginPhone("+91${phoneController.text.trim()}");
                  Get.off(() => const OtpScreen());
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: countrycode.text + phone,
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException e) {},
                  //   codeSent: (String verificationId, int? resendToken) {},
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

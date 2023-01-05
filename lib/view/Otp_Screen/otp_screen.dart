import 'package:flutter/material.dart';
import 'package:mlkeyprg/constants/pallete.dart';
import 'package:mlkeyprg/controller/auth_controller.dart';
import 'package:mlkeyprg/view/SignIn_Screen/widgets/gradient_button.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    
      fontSize: 20, color: Pallete.gradient1, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);
final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Pallete.gradient2),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromARGB(255, 0, 97, 177),
  ),
);

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 50),
              const Text(
                'Enter Your Otp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              // const PhoneField(),
              const SizedBox(height: 100),
              Pinput(
                length: 6,
                autofocus: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  otp=pin;
                  AuthController.instance.verifyOtp(otp);
                },
              ),
              const SizedBox(height: 50),
               GradientButton(onTap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}

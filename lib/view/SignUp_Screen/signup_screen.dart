import 'package:flutter/material.dart';
import 'package:mlkeyprg/view/SignIn_Screen/widgets/login_field.dart';
import 'package:mlkeyprg/view/SignUp_Screen/widgets/signup_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 50),
              const Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Confirm Password'),
              const SizedBox(height: 20),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

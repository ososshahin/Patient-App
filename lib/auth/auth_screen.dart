import 'package:flutter/material.dart';
import 'package:patient_app/auth/signin_form.dart';
import 'package:patient_app/auth/signup_form.dart';
import 'package:patient_app/widgets/input_field.dart';
import 'package:patient_app/widgets/sign_switcher.dart';

import '../widgets/auth_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 393,
          height: 852,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              // Sign choice container with switcher
              Positioned(
                left: 41,
                top: 33,
                child: SignSwitcher(
                  isSignIn: isSignIn,
                  onSwitch: (selected) {
                    setState(() {
                      isSignIn = selected;
                    });
                  },
                ),
              ),
              // Quote text
              Positioned(
                left: 44,
                top: 222,
                child: Container(
                  width: 309,
                  child: Text(
                    'You are few steps away from something great',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      color: Colors.black,
                      letterSpacing: -0.05,
                    ),
                  ),
                ),
              ),
              // Form fields
              Positioned(
                left: 41,
                top: 344,
                child: isSignIn ? SignInForm() : SignUpForm(),
              ),
              // Login/Signup button
              Positioned(
                left: 108,
                top: 753,
                child: AuthButton(
                  label: isSignIn ? 'Login' : 'SignUp',
                  onPressed: () {
                    // Handle login/signup logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


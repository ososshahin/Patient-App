import 'package:flutter/material.dart';

class SignSwitcher extends StatelessWidget {
  final bool isSignIn;
  final ValueChanged<bool> onSwitch;

  const SignSwitcher({
    Key? key,
    required this.isSignIn,
    required this.onSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 51,
      decoration: BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // SignIn
          Expanded(
            child: GestureDetector(
              onTap: () => onSwitch(true),
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn ? Color(0xFF007AFF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  'SignIn',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: isSignIn
                        ? Colors.white
                        : Color.fromRGBO(181, 181, 181, 0.55),
                    letterSpacing: -0.05,
                  ),
                ),
              ),
            ),
          ),
          // SignUp
          Expanded(
            child: GestureDetector(
              onTap: () => onSwitch(false),
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn ? Colors.transparent : Color(0xFF007AFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: isSignIn
                        ? Color.fromRGBO(181, 181, 181, 0.55)
                        : Colors.white,
                    letterSpacing: -0.05,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
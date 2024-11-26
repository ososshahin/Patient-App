import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

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
      width: 315.w, // Responsive width
      height: 51.h, // Responsive height
      decoration: BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 0.4),
        borderRadius: BorderRadius.circular(30.r), // Responsive border radius
      ),
      child: Stack(
        children: [
          // Animated background for the active button
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: isSignIn ? 0 : 157.5.w, // Adjusted with responsive width
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 157.5.w, // Responsive width
              height: 51.h, // Responsive height
              decoration: BoxDecoration(
                color: Color(0xFF007AFF),
                borderRadius: BorderRadius.circular(30.r), // Responsive border radius
              ),
            ),
          ),
          // SignIn button
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => onSwitch(true),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 28.sp, // Responsive font size
                          color: isSignIn
                              ? Colors.white
                              : Color.fromRGBO(181, 181, 181, 0.55),
                          letterSpacing: -0.05,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => onSwitch(false),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 28.sp, // Responsive font size
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
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class CustomButton extends StatelessWidget {
  final String ButtonLabel;

  CustomButton({required this.ButtonLabel, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5C8AFF),
      ),
      onPressed: () {
        // Button pressed action
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 60.w, // Responsive horizontal padding
          vertical: 10.h,   // Responsive vertical padding
        ),
        child: Text(
          ButtonLabel,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            fontSize: 30.sp, // Responsive font size
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w), // Responsive horizontal padding
          child: ClipRect(
            child: Image.asset(
              'assets/images/avatar.png',
              height: 175.h, // Responsive height
            ),
          ),
        ),
        SizedBox(height: 10.h), // Added space between image and text (responsive)
        Text(
          'Dr Mohammed Wagdy',
          style: TextStyle(
            fontSize: 25.sp, // Responsive font size
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

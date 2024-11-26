import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class Questionsdetailsscreen extends StatelessWidget {
  static const String routeName = 'questionsDetails';
  const Questionsdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'X',
            style: TextStyle(
              fontSize: 25.sp, // Responsive font size
              fontFamily: 'Epilogue',
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h), // Responsive spacing
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w), // Responsive margin
            decoration: BoxDecoration(
              color: Color(0xff5C8AFF),
              borderRadius: BorderRadius.circular(30.r), // Responsive radius
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w), // Responsive padding
              child: Text(
                'What is the best way to get my teeth brushed?',
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 25.sp, // Responsive font size
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Container(
            height: 540.h, // Responsive height
            width: 380.w, // Responsive width
            margin: EdgeInsets.symmetric(horizontal: 10.w), // Responsive margin
            decoration: BoxDecoration(
              color: Color(0xff5C8AFF),
              borderRadius: BorderRadius.circular(30.r), // Responsive radius
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctors Reply',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 25.sp, // Responsive font size
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'You can see these instructions below',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1,
                      fontSize: 25.sp, // Responsive font size
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w), // Responsive padding
                    child: Image.asset('assets/images/doctor_reply_image.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60.h), // Responsive spacing
        ],
      ),
    );
  }
}

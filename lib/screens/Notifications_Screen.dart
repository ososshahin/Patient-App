import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'home_screen.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = 'Notificationscreen';
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: Text(
            'X',
            style: TextStyle(
              fontSize: 25.sp, // Responsive font size
              fontFamily: 'Epilogue',
            ),
          ),
        ),
        title: Text(
          'Updates',
          style: TextStyle(
            fontSize: 25.sp, // Responsive font size
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.w), // Responsive padding
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9).withOpacity(0.58),
              borderRadius: BorderRadius.circular(12.r), // Responsive radius
            ),
            height: 70.h, // Responsive height
            child: Padding(
              padding: EdgeInsets.all(8.w), // Responsive padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Please be ready for your appointment',
                    style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp, // Responsive font size
                    ),
                  ),
                  Text(
                    '8:00 am',
                    style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp, // Responsive font size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

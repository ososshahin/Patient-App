import 'package:flutter/material.dart';
import 'package:patient_app/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class AppointmentSet extends StatelessWidget {
  static const String routeName = 'AppointmentSet';
  const AppointmentSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300.h), // Use responsive height
            Image.asset('assets/images/Appointment_ser.png'),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w), // Use responsive width
                child: Text(
                  '    Done appointment \n       has been set  \n        successfuly',
                  style: TextStyle(
                    fontSize: 30.sp, // Use responsive font size
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 200.h), // Use responsive height
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3393F8),
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 75.w, vertical: 5.h), // Use responsive padding
                child: Text(
                  'Exit',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    fontSize: 20.sp, // Use responsive font size
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

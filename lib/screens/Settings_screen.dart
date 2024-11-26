import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:patient_app/screens/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings Screen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<bool> Selections = [true, false];
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Settings',
          style: TextStyle(
            fontSize: 30.sp, // Responsive font size
            fontWeight: FontWeight.w700,
            fontFamily: 'Epilogue',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), // Responsive padding
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffE9E9E9),
            borderRadius: BorderRadius.circular(12.r), // Responsive border radius
          ),
          height: 55.h, // Responsive height
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h), // Responsive padding
                child: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20.sp, // Responsive font size
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 110.w),
              ToggleButtons(
                children: [
                  Text(
                    'English',
                    style: TextStyle(fontSize: 15.sp), // Responsive font size
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 0, 0, 0), // Responsive padding
                    child: Text(
                      'Arabic',
                      style: TextStyle(fontSize: 15.sp), // Responsive font size
                    ),
                  ),
                ],
                isSelected: Selections,
                onPressed: (index) {
                  setState(() {
                    if (index == 0) {
                      Selections[0] = true;
                      Selections[1] = false;
                      selectedLanguage = 'English';
                    } else {
                      Selections[1] = true;
                      Selections[0] = false;
                      selectedLanguage = 'Arabic';
                    }
                  });
                },
                selectedColor: Colors.black,
                fillColor: Colors.transparent,
                focusColor: Colors.transparent,
                color: Color(0xff282828).withOpacity(0.40),
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

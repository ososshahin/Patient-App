import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:patient_app/screens/Appointment_time_screen.dart';
import 'package:patient_app/screens/Notifications_Screen.dart';
import 'package:patient_app/screens/Settings_screen.dart';
import 'package:patient_app/screens/type_of_consultant_screen.dart';
import 'package:patient_app/widgets/ProfileInfo.dart';
import 'package:patient_app/widgets/question_button.dart';
import 'package:patient_app/widgets/questions_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  NotchBottomBarController? notchBottomBarController = NotchBottomBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: ClipRect(
          child: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
            child: Image.asset(
              'assets/images/ProfilePic.png',
              width: 33.w, // Responsive width
              height: 33.h, // Responsive height
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Find Care',
          style: TextStyle(
            fontSize: 30.sp, // Responsive font size
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            letterSpacing: 1.sp,
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, NotificationsScreen.routeName);
                },
                child: Icon(
                  Icons.notifications_active,
                  color: Colors.blue,
                  size: 30.sp, // Responsive size
                ),
              ),
              SizedBox(
                width: 20.w, // Responsive width
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w), // Use responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(),
            SizedBox(
              height: 10.h, // Responsive height
            ),
            QuestionsSection(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Color(0xff007BFF),
        itemLabelStyle: TextStyle(color: Colors.white),
        notchBottomBarController: notchBottomBarController!,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: ImageIcon(color: Colors.white, AssetImage('assets/images/homeicon.png')),
            activeItem: ImageIcon(AssetImage('assets/images/homeicon.png')),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: ImageIcon(AssetImage('assets/images/AddButtin.png'), color: Colors.white, size: 30.sp), // Responsive size
            activeItem: ImageIcon(AssetImage('assets/images/AddButtin.png'), color: Colors.white),
          ),
          BottomBarItem(
            inActiveItem: ImageIcon(AssetImage('assets/images/ap.png'), color: Colors.white),
            activeItem: ImageIcon(AssetImage('assets/images/ap.png')),
            itemLabel: 'Appointments',
          ),
        ],
        onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
          if (value == 1) {
            Navigator.pushReplacementNamed(context, AppointmentTimeScreen.routeName);
          }
        },
        kIconSize: 30.sp, // Responsive icon size
        kBottomRadius: 20.r, // Responsive radius
      ),
    );
  }
}

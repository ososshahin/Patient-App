import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/screens/AppointmentSet.dart';
import 'package:patient_app/screens/Appointment_time_screen.dart';
import 'package:patient_app/screens/Notifications_Screen.dart';
import 'package:patient_app/screens/QuestionsDetailsScreen.dart';
import 'package:patient_app/screens/Settings_screen.dart';
import 'package:patient_app/screens/askingQuestionScreen.dart';
import 'package:patient_app/screens/home_screen.dart';
import 'package:patient_app/auth/splash_screen.dart';
import 'package:patient_app/screens/type_of_consultant_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getString('access_token') != null && prefs.getString('access_token')!.isNotEmpty;

  runApp(ScreenUtilInit(
    designSize: Size(393, 852), // iPhone 11 size (or any design screen size you prefer)
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MyApp(isLoggedIn: isLoggedIn);
    },
  ));
}


class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomeScreen() : SplashScreen(),

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
        Askingquestionscreen.routeName:
        (context)=> Askingquestionscreen(),
       Questionsdetailsscreen.routeName:
        (context)=> Questionsdetailsscreen(),
        AppointmentTimeScreen.routeName:
        (context)=> AppointmentTimeScreen(),
       TypeOfConsultantScreen.routeName:
        (context)=> TypeOfConsultantScreen(),
     AppointmentSet.routeName:
        (context)=> AppointmentSet(),
        SettingsScreen.routeName:
        (context)=>SettingsScreen(),
      NotificationsScreen.routeName:
        (context)=>NotificationsScreen()
      },
    );
  }
}
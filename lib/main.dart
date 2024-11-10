import 'package:flutter/material.dart';
import 'package:patient_app/screens/main_screen.dart';

import 'auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: { MainScreen.routeName:(context)=>MainScreen()},
      initialRoute: MainScreen.routeName,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:patient_app/auth/auth_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = 'Main Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<Offset> _imageAnimation;

  late AnimationController _textController;
  late Animation<Offset> _textAnimation;

  late AnimationController _subTextController;
  late Animation<Offset> _subTextAnimation;

  late AnimationController _buttonController;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations for the splash screen
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _imageAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _imageController, curve: Curves.easeInOut),
        );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _textAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
        );

    _subTextController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _subTextAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _subTextController, curve: Curves.easeInOut),
        );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _buttonAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
        );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(Duration(milliseconds: 500));
    _imageController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _textController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _subTextController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    _subTextController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for the splash screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Image
          SlideTransition(
            position: _imageAnimation,
            child: Center(
              child: Image.asset(
                "assets/images/doctor_splash.png",
                width: 200.w, // Responsive width for the image
                height: 200.h, // Responsive height for the image
              ),
            ),
          ),
          SizedBox(height: 40.h), // Responsive spacing

          // Animated Main Text
          SlideTransition(
            position: _textAnimation,
            child: Text(
              "Your Doctor is One Tap away",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 34.sp, // Responsive font size
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
              ),
            ),
          ),

          // Animated Sub Text
          SlideTransition(
            position: _subTextAnimation,
            child: Text(
              "this is a subtext that can be edited",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff949191),
                fontSize: 21.sp, // Responsive font size
                fontWeight: FontWeight.w300,
                fontFamily: "Inter",
              ),
            ),
          ),
          SizedBox(height: 30.h), // Responsive spacing

          // Animated Button
          SlideTransition(
            position: _buttonAnimation,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => AuthScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // Start from the right
                      const end = Offset.zero; // End at its natural position
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 600),
                  ),
                );
              },
              child: Container(
                width: 331.w, // Responsive width for the button
                height: 56.h, // Responsive height for the button
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xff007AFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let’s get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 28.sp, // Responsive font size
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                    SizedBox(width: 10.w), // Responsive spacing
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "assets/images/double_right.png",
                        width: 24.w, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

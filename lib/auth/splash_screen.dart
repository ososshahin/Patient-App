import 'package:flutter/material.dart';
import 'package:patient_app/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
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

    // تحريك الصورة - تنزل من الأعلى
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _imageAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _imageController, curve: Curves.easeInOut),
        );

    // تحريك النص الرئيسي - يأتي من اليسار
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _textAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
        );

    // تحريك النص الفرعي - يأتي من اليمين
    _subTextController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _subTextAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _subTextController, curve: Curves.easeInOut),
        );

    // تحريك الزر - يصعد من الأسفل
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _buttonAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
        );

    // بدء التحريك بتأخيرات لخلق تأثير متتابع
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
      backgroundColor: Colors.white, // شاشة بيضاء عند البدء
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _imageAnimation,
            child: const Center(
              child: Image(
                image: AssetImage(
                  "assets/images/doctor_splash.png",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SlideTransition(
            position: _textAnimation,
            child: const Text(
              "Your Doctor is One Tap away",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter"),
            ),
          ),
          SlideTransition(
            position: _subTextAnimation,
            child: const Text(
              "this is a subtext that can be edited",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff949191),
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Inter"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SlideTransition(
            position: _buttonAnimation,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => AuthScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = Offset(1.0, 0.0); // يبدأ من الجانب الأيمن
                      var end = Offset.zero; // ينتهي في موضعه الطبيعي
                      var curve = Curves.easeInOut; // منحنى الحركة

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: 331,
                height: 56,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xff007AFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Let’s get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image(
                        image: AssetImage(
                          "assets/images/double_right.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

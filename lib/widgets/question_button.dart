import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:patient_app/screens/askingQuestionScreen.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(160, 0, 5.w, 0), // Responsive padding
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffBD5127),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r), // Responsive border radius
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, Askingquestionscreen.routeName);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h), // Responsive vertical padding
          child: Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/question_icon.png'),
                color: Colors.white,
              ),
              SizedBox(width: 20.w), // Responsive horizontal spacing
              Text(
                'Ask a question',
                style: TextStyle(
                  fontFamily: 'Epilogue',
                  fontSize: 16.sp, // Responsive font size
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

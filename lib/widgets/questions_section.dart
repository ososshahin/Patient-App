import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:patient_app/screens/QuestionsDetailsScreen.dart';
import 'package:patient_app/widgets/custom_button.dart';
import 'package:patient_app/widgets/question_button.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Questions for doctor',
          style: TextStyle(
            fontSize: 25.sp, // Responsive font size
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        Container(
          height: 300.h, // Responsive height
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              color: Color(0xffF7FAFC),
              child: Padding(
                padding: EdgeInsets.all(8.w), // Responsive padding
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is the best way to get my teeth brushed ?',
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                              fontFamily: 'Epilogue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Asked by Sara',
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                              fontFamily: 'Epilogue',
                              color: Color(0xff4F7396),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w), // Responsive horizontal spacing
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xffE8EDF2),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Questionsdetailsscreen.routeName);
                      },
                      child: Text(
                        'View',
                        style: TextStyle(
                          fontSize: 14.sp, // Responsive font size
                          fontFamily: 'Epilogue',
                          color: Color(0xff0D141C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        QuestionButton(), // This widget is already responsive
      ],
    );
  }
}

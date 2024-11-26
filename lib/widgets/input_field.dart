import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class InputField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w, // Responsive width
      height: 47.h, // Responsive height
      margin: EdgeInsets.only(bottom: 20.h), // Responsive margin
      decoration: BoxDecoration(
        color: const Color.fromRGBO(102, 102, 102, 0.17),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w), // Responsive horizontal padding
          hintStyle: TextStyle(
            color: const Color(0xFFA09F9F),
            fontSize: 20.sp, // Responsive font size
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscureText;

  const InputField({
    Key? key,
    required this.hint,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 47,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(102, 102, 102, 0.17),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintStyle: TextStyle(
            color: Color(0xFFA09F9F),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

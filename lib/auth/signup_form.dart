import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(hint: 'Name'),
        InputField(hint: 'Email / phone number'),
        InputField(hint: 'Password', obscureText: true),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:patient_app/widgets/input_field.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(hint: 'Email / phone number'),
        InputField(hint: 'Password', obscureText: true),
      ],
    );
  }
}
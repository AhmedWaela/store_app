import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.obsecureText});
  final bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: (value) {
        if(value!.isNotEmpty){
          return 'please enter';
        }
      },
    );
  }
}

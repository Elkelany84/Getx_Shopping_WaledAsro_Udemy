import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText});
  final TextEditingController controller;

  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.grey.shade200,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

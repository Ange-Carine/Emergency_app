import 'package:flutter/material.dart';

Widget reusableTextField(
  {String? labelText,
  String? hintText,
  bool? isPaswordType,
  TextInputType? keyboardType,
  IconButton? suffixIcon,
  Widget? prefixIcon,
  TextEditingController? controller}
) {
  return TextField(
    controller: controller,
    obscureText: isPaswordType!,
    enableSuggestions: !isPaswordType,
    autocorrect: !isPaswordType,
    cursorColor: Colors.black,
    keyboardType: keyboardType,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color(0xffECEAEA),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}
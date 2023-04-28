import 'package:flutter/material.dart';

Widget authButton({
  String? text,
  Color? textColor,
  Color? backgroundColor,
  double? width,
  double? height,
  Function()? onPressed,
}) {
  return Container(
    height: height,
    width: width,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(30)),
        ),
      child: Text(
        text!,
        style: TextStyle(
            color: textColor!, fontSize: 18),
      ),
    ),
  );
}
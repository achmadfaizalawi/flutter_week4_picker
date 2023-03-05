import 'package:flutter/material.dart';

class ChooseDataPicker extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? foregroundColor;

  const ChooseDataPicker({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? Colors.grey,
          backgroundColor: backgroundColor,
          side: BorderSide(width: 2, color: borderColor ?? Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        onPressed: onPressed, 
        child: Text(text, style: TextStyle(color: textColor ?? Colors.grey))),
    );
  }
}
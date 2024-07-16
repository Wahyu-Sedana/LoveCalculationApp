import 'package:flutter/material.dart';

import '../styles/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.event,
      required this.bgColor,
      this.shape,
      this.buttonHeight})
      : super(key: key);
  final dynamic text;
  final Function() event;
  final Color bgColor;
  final OutlinedBorder? shape;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(buttonHeight ?? 58.0),
          backgroundColor: bgColor,
          shape: shape),
      onPressed: () => event(),
      child: text is String ? Text(text, style: txtButtonStyle) : text,
    );
  }
}

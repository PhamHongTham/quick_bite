// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onpressed,
    this.backgroundColor = Colors.transparent,
    this.textColor,
    required this.textButton,
    this.textStyle,
  }) : super(key: key);
  final Function() onpressed;
  final Color? backgroundColor;
  final Color? textColor;
  final String textButton;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          textButton,
          style: textStyle,
        ),
      ),
    );
  }
}

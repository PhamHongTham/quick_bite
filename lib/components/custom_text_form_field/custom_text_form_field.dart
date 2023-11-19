// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        errorText: widget.errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.hDEDEDE),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsetsDirectional.all(16.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.hDEDEDE),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.hDEDEDE),
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyle.styleSplash_h939393_skip,
      ),
    );
  }
}

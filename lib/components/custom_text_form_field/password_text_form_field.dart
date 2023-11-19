// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_styles.dart';

class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.hintText,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isCheck = true;
  bool isHiden = true;
  String? _errorPassword;
  String? _errorConfirm;
  @override
  Widget build(BuildContext context) {
    print(isHiden);
    return TextFormField(
      onChanged: (value) {
        // print(value);
        // if (value.isEmpty) {
        //   isHiden = true;
        //   setState(() {});
        // } else {
        //   isHiden = false;
        //   setState(() {});
        // }
        if (value.length < 8) {
          isHiden = false;

          _errorPassword = 'Sử dụng 8 ký tự trở lên cho mật khẩu của bạn';
          setState(() {});
        } else if (value.contains(RegExp(r'[a-z]')) ||
            value.contains(RegExp(r'[!@#\$%^&*()]')) ||
            value.contains(RegExp(r'[0-9]'))) {
          _errorPassword =
              'Vui lòng chọn mật khẩu mạnh hơn. \nHãy thử kết hợp giữa chữ cái, chữ số và ký hiệu';
          isHiden = false;

          setState(() {});
        } else if (value.isEmpty) {
          isHiden = true;

          _errorPassword = null;
          setState(() {});
        }
      },
      obscureText: isCheck,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorText: _errorPassword,
        suffixIcon: isHiden
            ? null
            : GestureDetector(
                onTap: () {
                  setState(
                    () {
                      isCheck = !isCheck;

                      // if (!isCheck) {
                      //   isCheck = true;
                      // } else {
                      //   isCheck = false;
                      // }
                    },
                  );
                },
                child: Icon(isCheck ? Icons.visibility : Icons.visibility_off)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.hDEDEDE),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsetsDirectional.all(16.0),
        border: OutlineInputBorder(
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

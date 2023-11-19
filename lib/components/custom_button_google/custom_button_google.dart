import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_bite/gen/assets.gen.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_size.dart';

class CustomButtonGoogle extends StatelessWidget {
  const CustomButtonGoogle({
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
          border: Border.all(width: AppSize.sizebox1, color: AppColor.h9F9F9F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.icons.googleSvg),
            const SizedBox(width: AppSize.sizebox8),
            Text(
              textButton,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

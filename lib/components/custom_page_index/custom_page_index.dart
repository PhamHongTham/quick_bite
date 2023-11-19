import 'package:flutter/material.dart';
import 'package:quick_bite/res/app_colors.dart';

class CustomPageIndex extends StatelessWidget {
  const CustomPageIndex({
    super.key,
    required this.itemCount,
    required this.indexPage,
    this.activeColor = AppColor.hD42323,
    this.notactiveColor = AppColor.hAEAEAE,
  });

  final int indexPage;
  final int itemCount;
  final Color? activeColor;
  final Color? notactiveColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            width: indexPage == index ? 8 : 6,
            height: 6.0,
            decoration: BoxDecoration(
              color: indexPage == index ? activeColor : notactiveColor,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 8.0,
        ),
      ),
    );
  }
}

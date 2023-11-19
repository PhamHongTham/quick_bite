import 'package:flutter/material.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_styles.dart';
import 'package:quick_bite/screens/onbroading_screen/onbroading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnBroading(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.hEBEBEB,
        body: SafeArea(
          child: Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Quick', style: AppStyle.styleSplash_h0D0D0D),
                  TextSpan(text: 'Bite', style: AppStyle.styleSplash_hD42323),
                ],
              ),
            ),
          ),
        ));
  }
}

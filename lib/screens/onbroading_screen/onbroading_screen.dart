import 'package:flutter/material.dart';
import 'package:quick_bite/components/custom_button/custom_button.dart';
import 'package:quick_bite/components/custom_page_index/custom_page_index.dart';

import 'package:quick_bite/models/onbroading_model.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_size.dart';
import 'package:quick_bite/res/app_styles.dart';
import 'package:quick_bite/screens/signin_screen/signin_screen.dart';

class OnBroading extends StatefulWidget {
  const OnBroading({super.key});

  @override
  State<OnBroading> createState() => _OnBroadingState();
}

class _OnBroadingState extends State<OnBroading> {
  int current = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // print(Assets.images.on1.path);
    return Scaffold(
      backgroundColor: AppColor.hEBEBEB,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 94.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageImage(),
            const SizedBox(width: AppSize.sizebox64),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '${listonbroading[current].title1}',
                      style: AppStyle.styleSplash_h0D0D0D_on),
                  TextSpan(
                      text: '${listonbroading[current].title2}',
                      style: AppStyle.styleSplash_hD42323_on),
                ],
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              '${listonbroading[current].subTitle}',
              style: AppStyle.styleSplash_h9F9F9F,
            ),
            CustomPageIndex(
              indexPage: current,
              itemCount: listonbroading.length,
            ),
            const SizedBox(
              width: AppSize.sizebox49,
            ),
            current == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: CustomButton(
                      onpressed: () {
                        setState(
                          () {
                            current == 2
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ))
                                : pageController.nextPage(
                                    curve: Curves.linear,
                                    duration:
                                        const Duration(milliseconds: 100));
                          },
                        );
                      },
                      backgroundColor: AppColor.h0D0D0D,
                      textStyle: AppStyle.styleSplash_hFFFFFF,
                      textButton: listonbroading[current].textButton ?? '',
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onpressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ));
                          },
                          textStyle: AppStyle.styleSplash_h939393_skip,
                          textButton: 'Skip',
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.sizebox30,
                      ),
                      Expanded(
                        child: CustomButton(
                          onpressed: () {
                            setState(
                              () {
                                current == 2
                                    ? Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ))
                                    : pageController.nextPage(
                                        curve: Curves.linear,
                                        duration:
                                            const Duration(milliseconds: 100));
                              },
                            );
                          },
                          backgroundColor: AppColor.h0D0D0D,
                          textStyle: AppStyle.styleSplash_hFFFFFF,
                          textButton: listonbroading[current].textButton ?? '',
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _pageImage() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            current = value;
          });
        },
        itemCount: listonbroading.length,
        itemBuilder: (context, index) {
          return CircleAvatar(
            backgroundImage: AssetImage(listonbroading[index].image ?? ''),
            radius: 133.0,
          );
        },
      ),
    );
  }
}

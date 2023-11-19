import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_bite/components/custom_button/custom_button.dart';
import 'package:quick_bite/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:quick_bite/gen/assets.gen.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_size.dart';
import 'package:quick_bite/res/app_styles.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    String? _errorEmail;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.sizebox17, vertical: AppSize.sizebox16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(Assets.icons.arrowLeft)),
                      const SizedBox(width: AppSize.sizebox79),
                      const Text(
                        'Forgot password',
                        style: AppStyle.styleSplash_h0D0D0D_or,
                      )
                    ],
                  ),
                  const SizedBox(height: AppSize.sizebox48),
                  const Text(
                    'Reset link',
                    style: AppStyle.styleSplash_h0D0D0D_Resetlink,
                  ),
                  const Text(
                    'Enter your email address and we will send you the reset link',
                    style: AppStyle.styleSplash_h868686,
                  ),
                  const SizedBox(height: AppSize.sizebox32),
                  const Text(
                    'Email address',
                    style: AppStyle.styleSplash_h0D0D0D_email,
                  ),
                  const SizedBox(height: AppSize.sizebox8),
                  CustomTextFormField(
                    hintText: 'abel@domain.com',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    errorText: _errorEmail,
                    // onChanged: checkEmail,
                    // controller: _emailController,
                    // suffixIcon: Icon(
                    //   isCheck ? Icons.check : null,
                    //   color: Colors.green,
                    // ),
                  ),
                  const SizedBox(height: AppSize.sizebox24),
                  CustomButton(
                    onpressed: () {},
                    textButton: 'RESET PASSWORD',
                    textStyle: AppStyle.styleSplash_hFFFFFF,
                    backgroundColor: AppColor.hD42323,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

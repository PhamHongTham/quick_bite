import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:quick_bite/components/custom_button/custom_button.dart';
import 'package:quick_bite/components/custom_button_facebook/custom_button_facebook.dart';
import 'package:quick_bite/components/custom_button_google/custom_button_google.dart';
import 'package:quick_bite/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_size.dart';
import 'package:quick_bite/res/app_styles.dart';

import 'package:quick_bite/components/custom_text_form_field/password_text_form_field.dart';
import 'package:quick_bite/screens/signin_screen/signin_screen.dart';
import 'package:quick_bite/services/remote/authen_service.dart';
import 'package:quick_bite/services/remote/body/register_body.dart';
import 'package:quick_bite/services/remote/body/sendotp_body.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _codeController = TextEditingController();
String? _errorEmail;

bool isCheckEmail = false;
bool isCheckName = false;

String? _errorName;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    void checkEmail(p0) {
      if (p0.isEmpty || p0 == '') {
        isCheckEmail = false;
        _errorEmail = null;
        setState(() {});
      } else if (p0.contains('@')) {
        isCheckEmail = true;
        _errorEmail = null;
        setState(() {});
      } else {
        isCheckEmail = false;
        _errorEmail = 'Vui long nhap dung dinh dang email';
        setState(() {});
      }
    }

    void checkName(p0) {
      if (p0.isEmpty || p0 == '') {
        isCheckName = false;
        _errorName = null;
        setState(() {});
      } else {
        isCheckName = true;
        _errorName = 'Vui long nhap dung';
        setState(() {});
      }
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.sizebox16, vertical: AppSize.sizebox29),
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Les\'s', style: AppStyle.styleSplash_h0D0D0D),
                  TextSpan(
                      text: ' Sign you up, ',
                      style: AppStyle.styleSplash_hD42323),
                  TextSpan(
                      text: '\nyour meal awaits',
                      style: AppStyle.styleSplash_h0D0D0D),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.sizebox24,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: 'If you don’t have an',
                      style: AppStyle.styleSplash_h9F9F9F),
                  const TextSpan(
                      text: '\naccount please',
                      style: AppStyle.styleSplash_h9F9F9F),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ));
                        },
                      text: ' Sign in here',
                      style: AppStyle.styleSplash_hD42323_),
                ],
              ),
            ),
            const SizedBox(height: AppSize.sizebox24),
            const Text(
              'Full Name',
              style: AppStyle.styleSplash_h0D0D0D_email,
            ),
            const SizedBox(height: AppSize.sizebox8),
            CustomTextFormField(
              hintText: 'able',
              textInputAction: TextInputAction.next,
              onChanged: checkName,
              controller: _nameController,
              suffixIcon: Icon(
                isCheckName ? Icons.check : null,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: AppSize.sizebox16,
            ),
            const Text(
              'Email addres',
              style: AppStyle.styleSplash_h0D0D0D_email,
            ),
            const SizedBox(height: AppSize.sizebox8),
            CustomTextFormField(
              hintText: 'abel@domain.com',
              textInputAction: TextInputAction.next,
              errorText: _errorEmail,
              onChanged: checkEmail,
              controller: _emailController,
              suffixIcon: Icon(
                isCheckEmail ? Icons.check : null,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: AppSize.sizebox16,
            ),
            const Text(
              'OTP',
              style: AppStyle.styleSplash_h0D0D0D_email,
            ),
            const SizedBox(height: AppSize.sizebox8),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: _codeController,
                )),
                TextButton(
                  child: Text('SendOTP'),
                  onPressed: () {
                    SendOTPBody sendOTPBody = SendOTPBody()
                      ..email = _emailController.text.trim();
                    AuthenSevice().sendOTP(sendOTPBody).then((value) {
                      final data = jsonDecode(value.body);
                      if (data['status_code'] == 200) {
                        print('hongtham ${data['body']['code']}');
                      } else {
                        print(data['message']);
                      }
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: AppSize.sizebox16,
            ),
            const Text(
              'Password',
              style: AppStyle.styleSplash_h0D0D0D_email,
            ),
            const SizedBox(height: AppSize.sizebox8),
            CustomPasswordInput(
              hintText: 'Password',
              keyboardType: TextInputType.text,
              controller: _passwordController,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: AppSize.sizebox24),
            CustomButton(
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ));
              },
              textButton: 'SIGN IN',
              textStyle: AppStyle.styleSplash_hFFFFFF,
              backgroundColor: AppColor.hD42323,
            ),
            const SizedBox(height: AppSize.sizebox16),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'By signing up, you have agreed to our ',
                style: AppStyle.styleSplash_h868686,
                children: [
                  TextSpan(
                      text: '\nTerms and conditions ',
                      style: AppStyle.styleSplash_3567E7),
                  TextSpan(text: '&', style: AppStyle.styleSplash_h868686),
                  // WidgetSpan(child: Icon(Icons.and)),
                  TextSpan(
                      text: ' Privacy policy',
                      style: AppStyle.styleSplash_3567E7),
                ],
              ),
            ),
            const SizedBox(height: AppSize.sizebox24),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Or connect with',
                style: AppStyle.styleSplash_h0D0D0D_or,
              ),
            ),
            const SizedBox(height: AppSize.sizebox24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonFacebook(
                    onpressed: () {},
                    textButton: 'Facebook',
                    textStyle: AppStyle.styleSplash_h0D0D0D_,
                  ),
                ),
                const SizedBox(width: AppSize.sizebox22),
                Expanded(
                  child: CustomButtonGoogle(
                    onpressed: () {},
                    textButton: 'Google',
                    textStyle: AppStyle.styleSplash_h0D0D0D_,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

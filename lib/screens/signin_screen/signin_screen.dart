import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/components/custom_button/custom_button.dart';
import 'package:quick_bite/components/custom_button_facebook/custom_button_facebook.dart';
import 'package:quick_bite/components/custom_button_google/custom_button_google.dart';
import 'package:quick_bite/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:quick_bite/components/custom_text_form_field/password_text_form_field.dart';
import 'package:quick_bite/res/app_colors.dart';
import 'package:quick_bite/res/app_size.dart';
import 'package:quick_bite/res/app_styles.dart';
import 'package:quick_bite/screens/forgot_password/forgot_password.dart';
import 'package:quick_bite/screens/home_screen/home_screen.dart';
import 'package:quick_bite/screens/signup_screen/signup_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
String? _errorEmail;
bool isCheck = false;
bool isHiden = true;
//bool _ischeck = false;

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    void checkEmail(p0) {
      if (p0.contains('@') || p0.isEmpty || p0 == '') {
        isHiden = false;
        _errorEmail = null;
        isCheck = true;
        setState(() {});
      } else {
        isHiden = true;
        isCheck = false;
        _errorEmail = 'Vui long nhap dung dinh dang email';
        setState(() {});
      }
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.sizebox16, vertical: AppSize.sizebox32),
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Just', style: AppStyle.styleSplash_h0D0D0D),
                  TextSpan(
                      text: ' Sign in, ', style: AppStyle.styleSplash_hD42323),
                  TextSpan(
                      text: '\nwe’ll do the cooking',
                      style: AppStyle.styleSplash_h0D0D0D),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.sizebox16,
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
                      text: ' Sign up here',
                      style: AppStyle.styleSplash_hD42323_),
                ],
              ),
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
              textInputAction: TextInputAction.next,
              errorText: _errorEmail,
              onChanged: checkEmail,
              controller: _emailController,
              suffixIcon: Icon(
                isCheck ? Icons.check : null,
                color: Colors.green,
              ),
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
            const SizedBox(
              height: AppSize.sizebox16,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPassWord(),
                  ));
                },
                child: const Text(
                  'Forgot password?',
                  style: AppStyle.styleSplash_h0D0D0D_,
                ),
              ),
            ),
            const SizedBox(height: AppSize.sizebox24),
            CustomButton(
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              textButton: 'SIGN IN',
              textStyle: AppStyle.styleSplash_hFFFFFF,
              backgroundColor: AppColor.hD42323,
            ),
            const SizedBox(height: AppSize.sizebox38),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Or',
                style: AppStyle.styleSplash_h0D0D0D_or,
              ),
            ),
            const SizedBox(height: AppSize.sizebox24),
            // CustomButton(
            //   onpressed: () {},
            //   textStyle: AppStyle.styleSplash_h939393_skip,
            //   textButton: 'Connect with facebook',
            //   // border: Border.all(width: 1.0, color: AppColor.h9F9F9F),
            // ),
            // const SizedBox(height: AppSize.sizebox12),
            // CustomButton(
            //   onpressed: () {},
            //   textStyle: AppStyle.styleSplash_h939393_skip,
            //   textButton: 'Connect with google',
            //   // border: Border.all(width: 1.0, color: AppColor.h9F9F9F),
            // ),
            CustomButtonFacebook(
              onpressed: () {},
              textButton: 'Connect with facebook',
              textStyle: AppStyle.styleSplash_h0D0D0D_,
            ),
            const SizedBox(height: AppSize.sizebox12),
            CustomButtonGoogle(
              onpressed: () {},
              textButton: 'Connect with google',
              textStyle: AppStyle.styleSplash_h0D0D0D_,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/components/buttons/primary_button.dart';

import '../../../components/buttons/socal_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../screens/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.0,
            ),
            // SignInForm contains forget password
            SignInForm(),
            VerticalSpacing(of: 20),
            // Create new account
            Center(
              child: Text.rich(
                TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 13.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: "회원가입",
                      style: TextStyle(color: kActiveColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),

            VerticalSpacing(of: 20),

            // kOrText,
            // VerticalSpacing(of: 20),

            // // Facebook
            // SocalButton(
            //   press: () {},
            //   text: "Facebook 계정으로 로그인",
            //   color: Color(0xFF395998),
            //   icon: SvgPicture.asset(
            //     'assets/icons/facebook.svg',
            //     color: Color(0xFF395998),
            //   ),
            // ),
            // VerticalSpacing(),

            // // Google
            // SocalButton(
            //   press: () {},
            //   text: "Google 계정으로 로그인",
            //   color: Color(0xFF4285F4),
            //   icon: SvgPicture.asset(
            //     'assets/icons/google.svg',
            //   ),
            // ),
            // VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}

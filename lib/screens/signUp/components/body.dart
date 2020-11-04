import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

import '../../../screens/signIn/sign_in_screen.dart';
import '../../../size_config.dart';
import '../../../components/buttons/socal_button.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150.0),
              // Sign Up Form
              SignUpForm(),
              VerticalSpacing(of: 20),

              // Already have account
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 13.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: "로그인",
                        style: TextStyle(color: kActiveColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              VerticalSpacing(of: 15),
              //kOrText,
              VerticalSpacing(of: 15),

              // // Facebook
              // SocalButton(
              //   press: () {},
              //   text: "Connect with Facebook",
              //   color: Color(0xFF395998),
              //   icon: SvgPicture.asset(
              //     'assets/icons/facebook.svg',
              //     color: Color(0xFF395998),
              //   ),
              // ),
              // VerticalSpacing(of: 15),

              // // Google
              // SocalButton(
              //   press: () {},
              //   text: "Connect with Google",
              //   color: Color(0xFF4285F4),
              //   icon: SvgPicture.asset(
              //     'assets/icons/google.svg',
              //   ),
              // ),
              // VerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}

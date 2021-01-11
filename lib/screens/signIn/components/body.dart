import 'package:flutter/material.dart';
import 'package:hellocock/widgets/buttons/social_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../screens/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.0),
            // SignInForm contains forget password
            SignInForm(),

            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Text(
                      "이메일 찾기",
                      style: TextStyle(fontSize: 12),
                    )),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(fontSize: 12),
                    )),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                    child: Text(
                      "회원 가입",
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            ),

            VerticalSpacing(
              of: 50,
            ),
            SizedBox(
              height: 40,
              child: SocialButton(
                  text: "페이스북 이메일로 로그인",
                  image: "assets/icons/facebook.svg",
                  press: () {},
                  color: Color(0xFF1877F2),
                  textcolor: Colors.white),
            ),
            VerticalSpacing(
              of: 20,
            ),
            SizedBox(
              height: 40,
              child: SocialButton(
                  text: "구글 이메일로 로그인",
                  image: "assets/icons/google.svg",
                  press: () {},
                  color: Colors.white,
                  textcolor: Colors.grey),
            ),
            VerticalSpacing(
              of: 20,
            ),
          ],
        ),
      ),
    );
  }
}

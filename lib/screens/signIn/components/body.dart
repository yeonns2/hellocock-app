import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hellocock/widgets/bottom_nav_bar.dart';
import 'package:hellocock/widgets/buttons/social_button.dart';
import '../../../size_config.dart';
import '../../../screens/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.0),
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
                  press: () {
                    _handleSignIn().then((user) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar(user)));
                    });
                  },
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

  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    User user = (await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken)))
        .user;
    // 로그인 정보를 출력하는 로그
    print("signed in " + user.displayName);
    return user;
  }
}

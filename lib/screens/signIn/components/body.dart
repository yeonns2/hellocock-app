import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/bottom_nav_bar.dart';
import 'package:hellocock/screens/find_id/find_id_screen.dart';
import 'package:hellocock/screens/find_password/find_pw_screen.dart';
import 'package:hellocock/screens/loading_screen.dart';
import 'package:hellocock/screens/modify/modify.dart';
import 'package:hellocock/widgets/buttons/social_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../size_config.dart';
import '../../../screens/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  Future<User> _googlelogin() async {
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

  Future<User> _facebooklogin() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken.token);
        User user = (await _firebaseAuth.signInWithCredential(credential)).user;
        return user;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        return null;
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        return null;
        break;
    }
  }

  Future<User> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    User user =
        (await _firebaseAuth.signInWithCredential(oauthCredential)).user;

    await user.updateProfile(displayName: Scope.fullName.toString());
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 100),
            SignInForm(),
            VerticalSpacing(
              of: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindIDScreen(),
                          ),
                        ),
                    child: Text(
                      "이메일 찾기",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 12,
                          color: kBodyTextColor,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10,
                  child: VerticalDivider(
                    thickness: 1.2,
                    color: kBodyTextColor,
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindPWScreen(),
                          ),
                        ),
                    child: Text(
                      "비밀번호 찾기",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 12,
                          color: kBodyTextColor,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10,
                  child: VerticalDivider(
                    thickness: 1.2,
                    color: kBodyTextColor,
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                    child: Text(
                      "회원가입",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 12,
                          color: kBodyTextColor,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
            VerticalSpacing(
              of: 100,
            ),

            SocialButton(
                text: "Apple 계정으로 로그인",
                image: "assets/icons/apple.svg",
                press: () {
                  signInWithApple().then((User user) {
                    if (!user.emailVerified) {
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(user.email)
                          .set({
                        'name': user.displayName,
                        'email': user.email,
                        'certificated': false,
                        'phone': user.phoneNumber,
                        'address1': "",
                        'address2': "",
                        'marketing_agreement': false
                      });
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModifyScreen(user)));
                  });
                },
                color: Colors.white,
                textcolor: Colors.grey),

            VerticalSpacing(),
            SocialButton(
                text: "구글 이메일로 로그인",
                image: "assets/icons/google.svg",
                press: () {
                  _googlelogin().then((User user) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()));
                    if (!user.emailVerified) {
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(user.email)
                          .set({
                        'name': user.displayName,
                        'email': user.email,
                        'certificated': false,
                        'phone': user.phoneNumber,
                        'address1': "",
                        'address2': "",
                        'marketing_agreement': false
                      });
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar(user)));
                  });
                },
                color: Colors.white,
                textcolor: Colors.grey),

            VerticalSpacing(),
            // SizedBox(
            //   height: 40,
            //   child: SocialButton(
            //       text: "페이스북 계정으로 로그인",
            //       image: "assets/icons/facebook.svg",
            //       press: () {
            //         _facebooklogin().then((user) {
            //           FirebaseFirestore.instance
            //               .collection("user")
            //               .doc(user.email)
            //               .set({
            //             'name': user.displayName,
            //             'email': user.email,
            //             'address1': "",
            //             'address2': "",
            //             'phone': "",
            //             'like': null,
            //             'certificated': false
            //           });
            //           Navigator.pushReplacement(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => BottomNavBar(user)));
            //         });
            //       },
            //       color: Colors.white,
            //       textcolor: Colors.grey),
            // ),
            // VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}

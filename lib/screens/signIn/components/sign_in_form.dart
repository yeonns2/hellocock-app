import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/widgets/bottom_nav_bar.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            " 로그인",
            style: TextStyle(
                color: kActiveColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          VerticalSpacing(
            of: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이메일",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            controller: _emailController,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '이메일을 입력해주세요.';
              }
              return null;
            },
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "비밀번호",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            controller: _passwordController,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: "6자리 이상 입력해주세요.",
              hintStyle: TextStyle(fontSize: 14),
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) return '비밀번호를 입력해주세요.';
              return null;
            },
            obscureText: true,
          ),
          VerticalSpacing(
            of: 40,
          ),
          PrimaryButton(
            text: "로그인",
            press: () async {
              if (_formKey.currentState.validate()) {
                _signInWithEmailAndPassword().then((user) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavBar(user)));
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code of how to sign in with email and password.
  Future<User> _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      return user;
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
    return null;
  }
}

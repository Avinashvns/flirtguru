

import 'package:flirtguru/page/google/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText("Welcome in Flirt Guru"),
                      ScaleAnimatedText("SignUp Account"),
                    ],
                  repeatForever: true,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Sign Up"),
                  onPressed: ()async{

                    await GoogleSignInClass.SignIn();
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

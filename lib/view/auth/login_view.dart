import 'package:flutter/material.dart';
import 'package:store_app/res/components/common_button.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/res/components/common_textfield.dart';
import 'package:store_app/res/space.dart';
import 'package:store_app/view/auth/forgot_view.dart';
import 'package:store_app/view/home/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/store_logo.png')),
              SpaceH24(),
              CommonText(
                text: "Login into your account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SpaceH32(),
              CommonTextfield(labelText: 'Email'),
              SpaceH16(),
              CommonTextfield(labelText: 'Password'),
              SpaceH24(),
              CommonButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                text: 'Login',
              ),
              SpaceH16(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotView()),
                  );
                },
                child: CommonText(
                  text: 'Forgot password?',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

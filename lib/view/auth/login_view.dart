import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/res/components/common_button.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/res/components/common_textfield.dart';
import 'package:store_app/res/space.dart';
import 'package:store_app/view/auth/forgot_view.dart';
import 'package:store_app/view/bottom_navigation/buttom_nav_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedEmail();
  }

  Future<void> _loadSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('savedEmail') ?? '';
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              CommonTextfield(labelText: 'Email', controller: emailController),
              SpaceH16(),
              CommonTextfield(
                labelText: 'Password',
                controller: passwordController,
              ),
              SpaceH24(),
              CommonButton(
                onPressed: () async {
                  if (rememberMe == true) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('savedEmail', emailController.text);
                    prefs.setBool('rememberMe', true);
                  } else {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('savedEmail');
                    prefs.setBool('rememberMe', false);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtomNavView()),
                  );
                },
                text: 'Login',
              ),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  CommonText(
                    text: 'Remember me',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
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

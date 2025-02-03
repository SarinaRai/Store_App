import 'package:flutter/material.dart';
import 'package:store_app/res/components/common_button.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/res/components/common_textfield.dart';
import 'package:store_app/res/space.dart';
import 'package:store_app/view/auth/login_view.dart';
import 'package:store_app/view/auth/reset_view.dart';

class ForgotView extends StatelessWidget {
  ForgotView({super.key});
  final TextEditingController emailControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/store_logo.png'), height: 200),
            SpaceH32(),
            CommonText(
              text: "Forgot Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SpaceH32(),
            Align(
              alignment: Alignment.bottomLeft,
              child: CommonText(
                text: "Enter you email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SpaceH12(),
            CommonTextfield(
              labelText: "Enter email",
              controller: emailControllor,
            ),
            SpaceH32(),
            CommonButton(
              text: "Send",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetView()),
                );
              },
            ),
            SpaceH32(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "Already have an account ?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: CommonText(
                    text: "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

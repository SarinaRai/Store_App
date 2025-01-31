import 'package:flutter/material.dart';
import 'package:store_app/res/components/common_button.dart';
import 'package:store_app/res/space.dart';
import 'package:store_app/view/auth/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/store_logo.png')),
              SpaceH54(),

              CommonButton(
                text: "Let's Go",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

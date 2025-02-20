import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/res/components/common_button.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/res/components/common_textfield.dart';
import 'package:store_app/res/space.dart';
import 'package:store_app/view/auth/forgot_view.dart';
import 'package:store_app/view_model/auth_viewmodel.dart/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewmodel(),
      child: Consumer<LoginViewmodel>(
        builder: (context, viewModel, child) {
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpaceH32(),
                    CommonTextfield(
                      labelText: 'Email',
                      controller: viewModel.controllers.emailController,
                    ),
                    SpaceH16(),
                    CommonTextfield(
                      labelText: 'Password',
                      controller: viewModel.controllers.passwordController,
                    ),
                    SpaceH24(),
                    CommonButton(
                      onPressed: () {
                        var data = {
                          "email": viewModel.controllers.emailController.text,
                          "password":
                              viewModel.controllers.passwordController.text,
                        };
                        viewModel.loginApi(data, context);
                      },
                      text: 'Login',
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: viewModel.rememberMe,
                          onChanged: (value) {
                            viewModel.updateRemeberMe(value ?? false);
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
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/repository/auth_repo/auth_repo.dart';
import 'package:store_app/res/app_string.dart';
import 'package:store_app/res/text_editing_controller.dart';
import 'package:store_app/utils/config/utils.dart';
import 'package:store_app/view/bottom_navigation/buttom_nav_view.dart';

class LoginViewmodel extends ChangeNotifier {
  bool rememberMe = false;

  bool _loading = false;
  bool get loading => _loading;

  final AuthRepository loginRepo = AuthRepository();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  late TextEditingControllers _controllers;
  TextEditingControllers get controllers => _controllers;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  LoginViewmodel() {
    _controllers = TextEditingControllers();
    _loadSavedEmail();
  }

  void updateRemeberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  Future<void> saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (rememberMe) {
      await prefs.setBool('rememberMe', true);
      await prefs.setString('savedEmail', _controllers.emailController.text);
    } else {
      await prefs.setBool('rememberMe', false);
      await prefs.remove('savedEmail');
    }
  }

  Future<void> _loadSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('rememberMe') ?? false;
    if (rememberMe) {
      _controllers.emailController.text = prefs.getString('savedEmail') ?? '';
    }
    notifyListeners();
  }

  void dispoase() {
    _controllers.emailController.dispose();
    _controllers.passwordController.dispose();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    try {
      final value = await loginRepo.loginApi(data);
      final String? token = value["token"];
      if (token != null) {
        await _storage.write(key: 'auth_token', value: token);
        AppString.token = token;
        await saveEmail();
        Utils.flushBarSucessMessage("Successfully Login", context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ButtomNavView()),
        );
      } else {
        throw Exception('Token not found in respomse');
      }
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    } finally {
      setLoading(false);
    }
  }
}

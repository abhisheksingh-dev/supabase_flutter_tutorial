import 'package:flutter/material.dart';
import 'package:supabase_app_example/const.dart';

class LoginProvider with ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.idle;
  LoginStatus get loginStatus => _loginStatus;

  void updateLoginStatus({required bool res, bool? failed}) {
    if (res) {
      _loginStatus = LoginStatus.success;
    } else {
      _loginStatus = LoginStatus.idle;
    }
    //Explanation> if failed will be null then it will be false and it will be out of if statement
    if (failed ?? false) {
      _loginStatus = LoginStatus.failed;
    }
    notifyListeners();
  }
}

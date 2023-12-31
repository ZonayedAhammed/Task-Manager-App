import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_new/data/models/login_model.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userinfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setString("user-data", jsonEncode(model.toJson()));
    userinfo = model;
  }

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    String? value = _sharedPrefs.getString("user-data")!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
  }

  static Future<bool> checkIfuserLoggedIn() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    bool isLogin = _sharedPrefs.containsKey('user-data');
    if(isLogin){
      userinfo = await getUserInfo();

    }
    return isLogin;
  }
}

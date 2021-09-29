import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/models/request/login_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService{
  Future setRememberLogin(SignInRequest account) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(Constant.KEY_REMEMBER, account.remember);
    await preferences.setBool(Constant.KEY_KEEP_LOGIN, account.keepLogin);
    await preferences.setString(Constant.KEY_USERNAME, account.username);
    await preferences.setString(Constant.KEY_PASSWORD, account.password);
  }

  Future<SignInRequest> getRememberLogin() async {
    final preferences = await SharedPreferences.getInstance();
    final rememberMe = preferences.getBool(Constant.KEY_REMEMBER) ?? false;
    final keepLogin = preferences.getBool(Constant.KEY_KEEP_LOGIN) ?? false;

    final username = rememberMe || rememberMe != null
        ? preferences.getString(Constant.KEY_USERNAME)
        : '';
    final password = rememberMe || rememberMe != null
        ? preferences.getString(Constant.KEY_PASSWORD)
        : '';

    SignInRequest account =
    SignInRequest(username, password, rememberMe, keepLogin);
    return account;
  }

  Future removeRememberLogin() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(Constant.KEY_REMEMBER, false);
    preferences.setBool(Constant.KEY_KEEP_LOGIN, true);
  }

  Future logout() async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setBool(Constant.KEY_KEEP_LOGIN, false);
  }
}
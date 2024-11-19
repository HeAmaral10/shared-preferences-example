import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _isLoggedInKey = 'isLoggedIn';

  //Salva o estado de login no SharedPreferences
  static Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  //Recupera o estado de login do SharedPreferences
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ??
      false; //Retorna false se não estiver definido
  }

  //Remove o estado de login do SharedPreferences
  static Future<void> removeLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
  }
}

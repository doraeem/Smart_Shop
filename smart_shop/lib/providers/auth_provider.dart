import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final SharedPreferences prefs;

  AuthProvider(this.prefs);

  bool get isLoggedIn => prefs.getBool('isLoggedIn') ?? false;

  Future<void> login(String email, String password) async {
    if (email == 'user@test.com' && password == '123456') {
      await prefs.setBool('isLoggedIn', true);
      notifyListeners();
    } else {
      throw 'Invalid credentials';
    }
  }

  Future<void> logout() async {
    await prefs.remove('isLoggedIn');
    notifyListeners();
  }
}


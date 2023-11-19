import 'package:flutter/material.dart';

class UserAuthentication extends ChangeNotifier {
  String? accessToken;
  String? username;

  void setAuthenticationData(String accessToken, String username) {
    this.accessToken = accessToken;
    this.username = username;
    notifyListeners();
  }
}

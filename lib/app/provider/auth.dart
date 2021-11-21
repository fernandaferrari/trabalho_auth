import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trabalho/app/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _email;
  DateTime? _expiryDate;
  Timer? _logoutTimer;
  late String _url;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get userId {
    return isAuth ? _userId : null;
  }

  Future signup(String email, String password) async {
    _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCE4OGExfDqC4y7Wjj48s3eWXhjh02mYiw';
    final response = await post(
      Uri.parse(_url),
      body: jsonEncode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }
  }

  Future signin(String email, String password) async {
    _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCE4OGExfDqC4y7Wjj48s3eWXhjh02mYiw';
    final response = await post(
      Uri.parse(_url),
      body: jsonEncode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _userId = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(body['expiresIn'])),
      );
      _autoLogoutTimer();
      notifyListeners();
    }
  }

  void logout() {
    _token = null;
    _userId = null;
    _email = null;
    _expiryDate = null;
    clearAutoLogoutTimer();
  }

  void clearAutoLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void _autoLogoutTimer() {
    clearAutoLogoutTimer();
    final time = _expiryDate?.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: time ?? 0), logout);
  }
}

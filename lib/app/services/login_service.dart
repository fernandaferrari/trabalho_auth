import 'dart:convert';

import 'package:auth/app/utils/constants.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Constants().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print(response.body);
  }
}

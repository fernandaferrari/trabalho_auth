import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/pages/auth_page.dart';
import 'package:trabalho/app/pages/home_page.dart';
import 'package:trabalho/app/provider/auth.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? HomePage() : AuthPage();
  }
}

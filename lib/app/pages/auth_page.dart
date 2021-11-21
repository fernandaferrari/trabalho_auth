import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'form/auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 145,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Segurança de Sistemas",
                      style: GoogleFonts.chelseaMarket(fontSize: 28))
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            AuthForm(),
          ],
        ),
      ),
    );
  }
}

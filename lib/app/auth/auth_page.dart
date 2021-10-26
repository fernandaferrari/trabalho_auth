import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Segurança de Sistemas'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(child: 
          Column(
            children: [
              TextFormField(
                
              ),
              TextFormField(
                obscureText: true,
              ),
            ],
          )
        ,),
      ),
    );
  }
}
import 'package:auth/app/auth/auth_controller.dart';
import 'package:auth/app/auth/cadastro/components/custom_form.dart';
import 'package:auth/app/auth/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class CadastroAuth extends StatefulWidget {
  @override
  State<CadastroAuth> createState() => _CadastroAuthState();
}

class _CadastroAuthState extends ModularState<CadastroAuth, AuthController> {
  final _formKey = GlobalKey<FormState>();

  final _formData = AuthModel();

  var senha;

  @override
  Widget build(BuildContext context) {
    Future _submitForm() async {
      final isValid = _formKey.currentState?.validate() ?? false;

      if (!isValid) {
        return;
      }
      _formKey.currentState?.save();

      try {
        await controller.salvar(_formData);
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Deu tudo certo!'),
            content: Text('Cadastro concluído!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              )
            ],
          ),
        );
      } catch (e) {
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Ocorreu um erro!'),
            content: Text('Ocorreu um erro para salvar cadastro'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              )
            ],
          ),
        );
      }
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.amber,
            height: 40,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Cadastro Login",
                    style: GoogleFonts.chelseaMarket(fontSize: 25))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomTextField(
                          label: 'Nome Completo',
                          descText: 'Digite seu nome completo...',
                          onSaved: (name) => _formData.name = name ?? '',
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'O campo não pode ser nulo';
                            }
                            if (text.length < 4) {
                              return 'O campo deve ter no mínimo 4 caracteres';
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          label: 'E-mail',
                          descText: 'Digite seu e-mail...',
                          onSaved: (email) => _formData.email = email ?? '',
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'O campo não pode ser nulo';
                            }
                            if (text.length < 4) {
                              return 'O campo deve ter no mínimo 4 caracteres';
                            }
                            if (!EmailValidator.validate(text)) {
                              return 'E-mail inválido';
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          line: 1,
                          obscureText: true,
                          label: 'Senha',
                          descText: 'Digite sua senha...',
                          onSaved: (password) =>
                              _formData.password = password ?? '',
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'O campo não pode ser nulo';
                            }
                            if (password.length < 4) {
                              return 'O campo deve ter no mínimo 4 caracteres';
                            }

                            senha = password;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          line: 1,
                          obscureText: true,
                          label: 'Confirme sua senha',
                          descText: 'Digite sua senha...',
                          onSaved: (senha) => _formData.password = senha ?? '',
                          validator: (confirmPassword) {
                            if (confirmPassword == null ||
                                confirmPassword.isEmpty) {
                              return 'O campo não pode ser nulo';
                            }
                            if (confirmPassword.length < 4) {
                              return 'O campo deve ter no mínimo 4 caracteres';
                            }
                            if (senha != confirmPassword) {
                              return 'Senhas não conferem';
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: ElevatedButton.icon(
                              onPressed: _submitForm,
                              icon: Icon(Icons.save),
                              label: Text('Salvar')),
                        );
                      }),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

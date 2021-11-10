import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo Usuário!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text('Página Inicial'),
            onTap: () {
              Modular.to.pushNamed("/home");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.door_back_door_outlined),
            title: const Text('Deslogar'),
            onTap: () {
              Modular.to.pushNamed("/");
            },
          ),
        ],
      ),
    );
  }
}

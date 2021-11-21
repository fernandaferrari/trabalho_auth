import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/provider/auth.dart';
import 'package:trabalho/app/routes/app_routes.dart';
import 'package:trabalho/app/util/user_adm.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    print(auth.userId);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Uusário!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME,
              );
            },
          ),
          //'kTkYUx7aL3S5eOzbQyAW6pBwZkG3'

          Divider(),
          if (auth.userId == UserAdm.user_1)
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Gerenciar Produtos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.PRODUCT_GERENCIAR,
                );
              },
            ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME,
              );
            },
          ),
        ],
      ),
    );
  }
}

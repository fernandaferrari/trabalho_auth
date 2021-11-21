import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/pages/auth_or_home_page.dart';
import 'package:trabalho/app/pages/form/produto_form.dart';
import 'package:trabalho/app/pages/gerenciar_produtos_page.dart';
import 'package:trabalho/app/provider/auth.dart';
import 'package:trabalho/app/routes/app_routes.dart';

import 'provider/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Home>(
          create: (_) => Home(),
          update: (_, auth, previous) {
            return Home(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: ProductsOverviewPage(),
        routes: {
          AppRoutes.AUTH_OR_HOME: (ctx) => AuthOrHomePage(),
          AppRoutes.PRODUCT_GERENCIAR: (ctx) => GerenciarProdutos(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProdutoForm(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

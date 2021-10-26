import 'package:auth/app/auth/auth_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module{
  @override 
  List<Bind> get binds => [

  ];

  @override 
  List<ModularRoute> get routes =>[
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
  ];
}
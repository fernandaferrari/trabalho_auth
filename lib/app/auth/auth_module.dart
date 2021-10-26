import 'package:auth/app/auth/auth_page.dart';
import 'package:auth/app/repository/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
      ];
}

import 'package:auth/app/auth/auth_controller.dart';
import 'package:auth/app/auth/auth_page.dart';
import 'package:auth/app/auth/cadastro/cadastro_auth.dart';
import 'package:auth/app/repository/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository()),
        Bind((i) => AuthController(i.get<AuthRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
        ChildRoute('/cadastro', child: (_, args) => CadastroAuth()),
      ];
}

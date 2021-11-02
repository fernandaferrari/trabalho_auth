import 'package:auth/app/auth/model/auth_model.dart';
import 'package:mobx/mobx.dart';

import 'package:auth/app/repository/auth_repository.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  AuthRepository repository;

  _AuthControllerBase(
    this.repository,
  );

  @action
  salvar(AuthModel auth) async {
    await repository.save(auth);
  }
}

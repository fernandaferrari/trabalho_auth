import 'package:auth/app/auth/model/auth_model.dart';
import 'package:auth/app/database/connection.dart';

class AuthRepository {
  save(AuthModel auth) async {
    var _db = await Connection.instance.database;
    var sql;
    if (auth.id == null) {
      sql =
          'INSERT INTO auth(name, email, password, confirm_password) VALUES (?,?,?,?)';
      _db.rawInsert(
          sql, [auth.name, auth.email, auth.password, auth.confirmPassword]);
    } else {
      sql =
          'UPDATE auth SET name=?, email=?, password=?, confirm_password=? WHERE id=?';
      _db.rawUpdate(sql, [
        auth.name,
        auth.email,
        auth.password,
        auth.confirmPassword,
        auth.id
      ]);
    }
  }
}

import 'dart:convert';

import 'package:auth/app/auth/model/auth_model.dart';
import 'package:auth/app/database/connection.dart';
import 'package:http/http.dart' as http;

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
    List<Map<String, dynamic>> resultado =
        await _db.rawQuery('SELECT * FROM auth ORDER BY id DESC LIMIT 1');
    List<AuthModel> auths = List.generate(resultado.length, (index) {
      var item = resultado[index];
      return AuthModel(
          id: item['id'],
          name: item['name'],
          email: item['email'],
          password: item['password'],
          confirmPassword: item['confirm_password']);
    });

    int id = 0;
    auths.forEach((element) {
      id = element.id!;
    });

    final response = await http.post(
        Uri.parse('https://auth-4f5c3-default-rtdb.firebaseio.com/auth.json'),
        body: jsonEncode({
          'id': id,
          'name': auth.name,
          'email': auth.email,
          'password': auth.password,
          'confirm_password': auth.confirmPassword
        }));
  }
}

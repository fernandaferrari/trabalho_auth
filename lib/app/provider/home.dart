import 'package:flutter/material.dart';
import 'package:trabalho/app/model/produto.dart';

class Home extends ChangeNotifier {
  String _token;
  List<Produto> _items = [];
  Home(
    this._token,
    this._items,
  );

  List<Produto> get items => [..._items];
}

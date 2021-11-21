import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/app_drawer.dart';
import 'package:trabalho/app/provider/home.dart';
import 'package:trabalho/app/routes/app_routes.dart';

import 'components/produto_item.dart';

class GerenciarProdutos extends StatefulWidget {
  const GerenciarProdutos({Key? key}) : super(key: key);

  @override
  _GerenciarProdutosState createState() => _GerenciarProdutosState();
}

class _GerenciarProdutosState extends State<GerenciarProdutos> {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Home>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final Home products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(products.items[i]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

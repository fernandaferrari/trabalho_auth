import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/model/produto.dart';
import 'package:trabalho/app/pages/components/produto_grid_item.dart';
import 'package:trabalho/app/provider/home.dart';

class ProdutoGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProdutoGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Home>(context);
    final List<Produto> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

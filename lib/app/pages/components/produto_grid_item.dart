import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/app/model/produto.dart';
import 'package:trabalho/app/provider/auth.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Produto>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Produto>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavorite(auth.token ?? '', auth.userId ?? '');
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

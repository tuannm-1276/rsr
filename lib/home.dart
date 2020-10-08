import 'package:flutter/material.dart';
import 'package:mcd01/model/product.dart';
import 'package:mcd01/model/products_repository.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products.map((product) {
      return Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(product.assetName, fit: BoxFit.fitWidth),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(product == null ? '' : product.name,
                        style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                    SizedBox(height: 4.0),
                    Text(formatter.format(product.price),
                        style: theme.textTheme.caption)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu, semanticLabel: 'menu'),
              onPressed: () {
                print('menu button');
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, semanticLabel: 'search'),
              onPressed: () {
                print('search');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('filter');
              },
            )
          ],
          title: Text('Sun* Rewarding System'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(6.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context),
        ));
  }
}

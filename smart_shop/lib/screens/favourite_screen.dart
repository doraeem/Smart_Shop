import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_cart.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favs = Provider.of<ProductProvider>(context).favourites;

    return Scaffold(
      appBar: AppBar(title: Text('Favourites')),
      body: favs.isEmpty
          ? Center(child: Text('No favourites yet'))
          : ListView.builder(
        itemCount: favs.length,
        itemBuilder: (ctx, i) => ProductCard(product: favs[i]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final isFavourite = productProvider.favouriteIds.contains(product.id);

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(product.image, width: 50),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${product.price}'),
            RatingBarIndicator(
              rating: product.rating,
              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 16.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
              onPressed: () => productProvider.toggleFavourite(product.id),
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => cartProvider.addToCart(product),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_cart.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSort = '';

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<ProductProvider>(context, listen: false).fetchProducts();
            },
          ),
          Consumer<CartProvider>(
            builder: (_, cart, child) => Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                ),
                if (cart.itemCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.itemCount.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedSort.isEmpty ? null : selectedSort,
            hint: Text('Sort by'),
            items: [
              DropdownMenuItem(value: 'low', child: Text('Price: Low → High')),
              DropdownMenuItem(value: 'high', child: Text('Price: High → Low')),
              DropdownMenuItem(value: 'rating', child: Text('Rating')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => selectedSort = value);
                Provider.of<ProductProvider>(context, listen: false).sortBy(value);
              }
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => Provider.of<ProductProvider>(context, listen: false).fetchProducts(),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => ProductCard(product: products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

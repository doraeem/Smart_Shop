import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<int> _favourites = [];

  List<Product> get products => _products;
  List<int> get favouriteIds => _favourites;

  Future<void> fetchProducts() async {
    final res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (res.statusCode == 200) {
      final List decoded = json.decode(res.body);
      _products = decoded.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void toggleFavourite(int id) {
    if (_favourites.contains(id)) {
      _favourites.remove(id);
    } else {
      _favourites.add(id);
    }
    notifyListeners();
  }

  List<Product> get favourites =>
      _products.where((p) => _favourites.contains(p.id)).toList();

  void sortBy(String criteria) {
    switch (criteria) {
      case 'low':
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'high':
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        _products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    notifyListeners();
  }
}

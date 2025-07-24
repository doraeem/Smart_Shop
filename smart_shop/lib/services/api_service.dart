import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<Product>> fetchByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/products/category/$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load category products');
    }
  }
}

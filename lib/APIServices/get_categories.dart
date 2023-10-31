import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sizzco/Config.dart';
import 'package:sizzco/Models/categories_model.dart';

class GetCategories {
  Future<List<CategoryModel>> getProductsForCategory() async {
    // Make a GET request to the WooCommerce REST API.
    final response = await http.get(
      Uri.parse(
          'https://sizzco.com/wp-json/wc/v3/products/categories?consumer_key=${Config().ck}&consumer_secret=${Config().cs}'),
      // headers: {
      //   'Authorization': 'Bearer YOUR_API_KEY',
      // },
    );

    // Check if the request was successful.
    if (response.statusCode == 200) {
      // Parse the JSON response and extract the product information.
      final products = jsonDecode(response.body) as List<dynamic>;
      return products
          .map((product) => CategoryModel.fromJson(product))
          .toList();
    } else {
      // Throw an error if the request was not successful.
      throw Exception(
          'Failed to get product list for category: ${response.statusCode}');
    }
  }

  Future<List<CategoryModel>> getFeaturedForCategory() async {
    // Make a GET request to the WooCommerce REST API.
    final response = await http.get(
      Uri.parse(
          'https://sizzco.com/wp-json/wc/v3/products/categories?consumer_key=${Config().ck}&consumer_secret=${Config().cs}&featured=true'),
      // headers: {
      //   'Authorization': 'Bearer YOUR_API_KEY',
      // },
    );

    // Check if the request was successful.
    if (response.statusCode == 200) {
      // Parse the JSON response and extract the product information.
      final products = jsonDecode(response.body) as List<dynamic>;
      return products
          .map((product) => CategoryModel.fromJson(product))
          .toList();
    } else {
      // Throw an error if the request was not successful.
      throw Exception(
          'Failed to get product list for category: ${response.statusCode}');
    }
  }
}

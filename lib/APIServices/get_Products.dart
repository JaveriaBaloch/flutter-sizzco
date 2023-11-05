import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sizzco/Config.dart';
import 'package:sizzco/Models/products_model.dart';

class GetProductsMethods {
  Future<List<WooCommerceProduct>> getProducts() async {
    // Make a GET request to the WooCommerce REST API.
    final response = await http.get(
      Uri.parse(
          '${Config().web}/wp-json/wc/v3/products?consumer_key=${Config().ck}&consumer_secret=${Config().cs}'),
    );

    // Check if the request was successful.
    if (response.statusCode == 200) {
      // Parse the JSON response and extract the product information.
      final products = jsonDecode(response.body) as List<dynamic>;
      return products
          .map((product) => WooCommerceProduct.fromJson(product))
          .toList();
    } else {
      // Throw an error if the request was not successful.
      throw Exception('Failed to get product list: ${response.statusCode}');
    }
  }

  Future<List<WooCommerceProduct>> getProductsByName(String text) async {
    try {
      final response = await http.get(Uri.parse(
          'https://sizzco.com/wp-json/wc/v3/products?search=${text}&consumer_key=${Config().ck}&consumer_secret=${Config().cs}'));

      if (response.statusCode == 200) {
        final productListJson = jsonDecode(response.body) as List;
        List<WooCommerceProduct> fetchedProducts = productListJson
            .map((productJson) => WooCommerceProduct.fromJson(productJson))
            .toList();
        print(fetchedProducts);
        return fetchedProducts;
      } else {
        throw Exception('Failed to get products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      rethrow; // Rethrow the exception after printing
    }
  }

  Future<List<WooCommerceProduct>> getProductsByCategories(String text) async {
    try {
      print(text);
      final response = await http.get(Uri.parse(
          'https://sizzco.com/wp-json/wc/v3/products/?category=$text&consumer_key=${Config().ck}&consumer_secret=${Config().cs}'));
      if (response.statusCode == 200) {
        final productListJson = jsonDecode(response.body) as List;
        List<WooCommerceProduct> fetchedProducts = productListJson
            .map((productJson) => WooCommerceProduct.fromJson(productJson))
            .toList();
        print(fetchedProducts);
        return fetchedProducts;
      } else {
        throw Exception('Failed to get products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      rethrow; // Rethrow the exception after printing
    }
  }
}

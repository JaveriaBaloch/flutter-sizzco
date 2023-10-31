import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Flutter;
import 'package:http/http.dart' as http;
import 'package:sizzco/Config.dart';
import 'package:sizzco/widgets/discounted_bar_widget.dart';

import '/Models/products_model.dart';

class DayDealsProductsPage extends StatefulWidget {
  @override
  State<DayDealsProductsPage> createState() => _DayDealsProductsPageState();
}

class _DayDealsProductsPageState extends State<DayDealsProductsPage> {
  late Future<List<WooCommerceProduct>> products;

  @override
  void initState() {
    super.initState();
    products = _getProducts();
  }

  Future<List<WooCommerceProduct>> _getProducts() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sizzco.com/wp-json/wc/v3/products?consumer_key=${Config().ck}&consumer_secret=${Config().cs}&tags=Deals%20of%20the%20day'));

      if (response.statusCode == 200) {
        final productListJson = jsonDecode(response.body);

        List<WooCommerceProduct> fetchedProducts = [];
        for (final productJson in productListJson) {
          final product = WooCommerceProduct.fromJson(productJson);
          fetchedProducts.add(product);
        }
        return fetchedProducts;
      } else {
        throw Exception('Failed to get products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WooCommerceProduct>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Flutter.Image.asset(
              'assets/not_connecting.png',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          );
        } else {
          List<WooCommerceProduct> products = snapshot.data ?? [];
          return Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  String discount = "";
                  final product = products[index];
                  if (product.name != "Product" &&
                      product.regularPrice != null &&
                      product.price != null) {
                    discount = (100 -
                            ((double.parse(product.price!) /
                                    double.parse(product.regularPrice!)) *
                                100))
                        .toStringAsFixed(0);
                  }
                  if (product.images.isNotEmpty) {
                    return discountCard(
                        product.images[0].src,
                        product.name!,
                        product.stockStatus!,
                        discount,
                        product.regularPrice!,
                        product.price!,
                        context,
                        product);
                  } else {
                    return SizedBox();
                  }
                },
              ));
        }
      },
    );
  }
}

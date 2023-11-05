import 'package:flutter/material.dart';
import 'package:sizzco/APIServices/get_Products.dart';

import '../Models/products_model.dart';
import '../widgets/discounted_bar_widget.dart';

Widget SearchProducts(String text) {
  Future<List<WooCommerceProduct>> products =
      GetProductsMethods().getProductsByName(text);

  return FutureBuilder<List<WooCommerceProduct>>(
    future: products,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        List<WooCommerceProduct> products = snapshot.data ?? [];
        return products.length!=0?Wrap(
          spacing: 5.0,
          runSpacing: 10.0,
          children: List.generate(products.length, (index) {
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
              return Container();
            }
          }),
        ):Center(
          child: Image.asset('assets/empy.png'),
        )
        ;
      }
    },
  );
}

import 'package:flutter/material.dart';
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/widgets/bottomNav.dart';

import '../../Models/products_model.dart';
import '../../widgets/discounted_bar_widget.dart';

class SavedItems extends StatefulWidget {
  const SavedItems({Key? key}) : super(key: key);

  @override
  State<SavedItems> createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  List<WooCommerceProduct> products = [];

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    // await StorageHelper.writeToFile("wishlist.json", products);
    await StorageHelper().readFromFile('wishlist.json').then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: products.length > 0
            ? Wrap(
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
                      product,
                    );
                  } else {
                    return Container();
                  }
                }),
              )
            : Center(
                child: Image.asset('assets/empy.png'),
              ),
      )),
      bottomNavigationBar: NavBar(select: 3),
    );
  }
}

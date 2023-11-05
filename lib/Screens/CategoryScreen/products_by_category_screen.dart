import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Flutter;
import 'package:sizzco/APIServices/get_Products.dart';
import 'package:sizzco/Models/products_model.dart';
import 'package:sizzco/widgets/empty_collection.dart';

import '../../widgets/bottomNav.dart';
import '../../widgets/discounted_bar_widget.dart';
import '../../widgets/searchFlied.dart';
import '../search_product.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final String text;

  const ProductByCategoryScreen({Key? key, required this.text})
      : super(key: key);

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  late Future<List<WooCommerceProduct>> categories;
  TextEditingController controller = TextEditingController();
  String searchtext = '';

  @override
  void initState() {
    super.initState();
    getAll();
  }

  void getAll() async {
    String text = widget.text;
    categories = GetProductsMethods().getProductsByCategories(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextSearch(controller, search, context),
              searchtext == ""
                  ? FutureBuilder<List<WooCommerceProduct>>(
                      future: categories,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<WooCommerceProduct>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          List<WooCommerceProduct> products =
                              snapshot!.data!;
                          return products.length>0?Wrap(
                            alignment: WrapAlignment.center,
                            // spacing: 5.0, // Adjust the spacing between the items
                            // runSpacing: 10.0, // Adjust the run spacing
                            children: List.generate(products.length, (index) {
                              String discount = "";
                              final product = products[index];
                              // if (product.name != "Product" &&
                              //     product.regularPrice != null &&
                              //     product.price != null) {
                                discount = (100 -
                                        ((double.parse(product.price!) /
                                                double.parse(
                                                    product.regularPrice!)) *
                                            100))
                                    .toStringAsFixed(0);
                              // }
                              if (
                                  product.images.isNotEmpty) {
                                return SizedBox(
                                  width: 170,
                                  height: 250, // Adjust the width here
                                  child: discountCard(
                                    product.images[0].src,
                                    product.name!,
                                    product.stockStatus!,
                                    discount,
                                    product.regularPrice!,
                                    product.price!,
                                    context,
                                    product,
                                  ),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            }),
                          ):NoItemFound(context);
                        }
                      },
                    )
                  : SearchProducts(searchtext),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(select: 1),
    );
  }

  void search() {
    setState(() {
      searchtext = controller.text;
    });
  }
}

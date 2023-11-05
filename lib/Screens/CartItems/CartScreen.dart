import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizzco/Screens/CartItems/checkout.dart';
import 'package:sizzco/Screens/Login/user_login.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:sizzco/widgets/primaryText.dart';

import '../../APIServices/storage.dart';
import '../../Models/products_model.dart';
import '../../widgets/bottomNav.dart';
import '../../widgets/discounted_bar_widget.dart';
import '../../widgets/shipping_cost_maker.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? id = '';
  List<WooCommerceProduct> products = [];
  double total = 0;

  static Future<String?> getString(String key) async {
    var _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  void initState() {
    super.initState();
    check();
    getTotal();
  }

  void getTotal() {
    products.forEach((element) {
      double price = double.parse(element.price!);
      total += price * element.quantity!;
    });
  }

  void check() async {
    await StorageHelper().readFromFile('cart.json').then((value) {
      setState(() {
        products = value;
        products.forEach((element) {
          double price = double.parse(element.price!);
          total += price * element.quantity!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: products.length > 0
              ? Center(
                  // padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
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
                                            double.parse(
                                                product.regularPrice!)) *
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.getLightPrimaryColor(),
                        ),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimaryText("Total: \$$total"),
                            ShippingCostMarker(),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.getPrimaryColor(),
                              ),
                              onPressed: () {

                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => CheckoutScreen()));
                                  //
                                  // Fluttertoast.showToast(
                                  //     msg: 'Please Login First');
                                  // Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //         builder: (_) => LoginScreen()));
                              },
                              child: Text("Checkout"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Image.asset('assets/empy.png'),
                ),
        ),
      ),
      bottomNavigationBar: NavBar(select: 2),
    );
  }
}

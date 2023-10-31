import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/Models/AddressModels.dart';
import 'package:sizzco/Models/checkout_model.dart';
import 'package:sizzco/Models/products_model.dart';

import '../Config.dart';

Future<bool> placeCashOnDeliveryOrder(
    String method, String title, Billing billing, Shipping shipping) async {
  List<ProductItem> products = [];
  double total = 0;
  await StorageHelper().readFromFile('cart.json').then((value) {
    value.forEach((element) {
      ProductItem item =
          ProductItem(productId: element.id, quantity: element.quantity ?? 0);
      double price = double.parse(element.price!) * element.quantity!;
      total += price;
      products.add(item);
    });
  });
  Map<String, dynamic> value = {
    "payment_method": method,
    "payment_method_title": title,
    "set_paid": false,
    "billing": billing,
    "shipping": shipping,
    "line_items": products,
    "shipping_lines": [
      {"method_id": "flat_rate", "method_title": "Flat Rate", "total": "70.0"}
    ],
    'payment_method': method,
  };

  try {
    final url = Uri.parse(
        '${Config().web}/wp-json/wc/v3/orders?consumer_key=${Config().ck}&consumer_secret=${Config().cs}');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(value),
    );

    if (response.statusCode == 201) {
      // Order successfully placed
      List<WooCommerceProduct> cart = [];
      await StorageHelper.writeToFile('cart.json', cart);
      print(response.body);
      return true;
    } else {
      // Order placement failed
      print(response.body);
      return false;
    }
  } catch (e) {
    // Error handling for HTTP request
    print('Error occurred: $e');
    return false;
  }
}

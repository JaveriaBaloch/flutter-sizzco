import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/Models/AddressModels.dart';
import 'package:sizzco/Models/checkout_model.dart';
import 'package:sizzco/Models/products_model.dart';
import '../Config.dart';

Future<bool> placeOrder(
    String method, String title, Billing billing, Shipping shipping, bool status) async {
  try {
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
      "set_paid": status,
      "billing": billing.toJson(), // Ensure toJson is implemented in Billing class
      "shipping": shipping.toJson(), // Ensure toJson is implemented in Shipping class
      "line_items": products.map((item) => item.toJson()).toList(), // Ensure toJson is implemented in ProductItem class
      "shipping_lines": [
        {"method_id": "flat_rate", "method_title": "Flat Rate", "total": "70.0"}
      ],
    };

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
      sendEmail(billing,title,total);
      if (kDebugMode) {
        print(response.body);
      }
      return true;
    } else {
      // Order placement failed
      if (kDebugMode) {
        print('Error: ${response.statusCode} - ${response.body}');
      }
      return false;
    }
  } catch (e) {
    // Error handling for HTTP request
    if (kDebugMode) {
      print('Error occurred: $e');
    }
    return false;
  }
}

Future<void> sendEmail(Billing bill,String method,double total) async {
  try {
    final smtpServer = gmail('sizzco2@gmail.com', 'qkyu exad ahml eoop');

    List<WooCommerceProduct> products = [];

    await StorageHelper().readFromFile('cart.json').then((value) {
      for (var element in value) {
        products.add(element);
      }
    });

    final listItems = '''
  <div style="width:100%;">
    ${products.map((e) {
      return '''
        <div style='width:100%;display:flex;justify-content:space-between;align-items:center;'>
          <img src="${e.images[0].src}" width="100" height="100" style="object-fit:cover;"/>
          <div>
            <p>Quantity: ${e.quantity}</p>
            <p>Product Name: ${e.name}</p>
            <p>Price: \$${e.price}</p>
          </div>
        </div>
      ''';
    }).join()}
    <hr>
    <h3>Total: \$$total</h3>
  </div>
''';

    final message = Message()
      ..from = Address(bill.email, bill.firstName)
      ..recipients.add(const Address('mysizzco@gmail.com'))
      ..subject = 'Successful Order Placement'
      ..text = 'Hi ${bill.firstName}, Here are the details of your recurrent order'
      ..html = '''
        <div style="padding:1.5rem">
          <h2>Ordered Items</h2>
          $listItems
          <br/>
          <hr/>
          <h3>Contact info</h3>
          <p>Phone number:\t${bill.phone}</p>
          <p>Email:\t${bill.email}</p>
          <br>
          <hr/>
          <h3>Delivery Details</h3>
          <p>Address:\t${bill.address1}</p>
          <p>Post code:\t${bill.postcode}</p>
          <p>City:\t${bill.city}</p>
          <p>Country:\t${bill.country}</p>
          <br>
          <hr/>
          <h3>Payment Details:</h3>
          <p>Payment Method:\t$method</p>
          <p>Amount to pay:\t\$${total + 70}</p>
          <p>Shipping cost:\t\$70</p>
          <br>
          <hr/>
          <p>If you face any problems with your order, contact us at <a href="mailto:contact@sizzco.com">contact@sizzco.com</a></p>
          <br/>
          <p>Thank you so much for trusting Sizzco; hope to have you back soon!</p>
        </div>
      ''';

    final sendReport = await send(message, smtpServer);
    if (kDebugMode) {
      print('Email sent: ${sendReport.mail}');
    }

  } catch (e) {
    if (kDebugMode) {
      print('Error sending email: $e');

    }
  }
  List<WooCommerceProduct> cart = [];
  await StorageHelper.writeToFile('cart.json', cart);
}

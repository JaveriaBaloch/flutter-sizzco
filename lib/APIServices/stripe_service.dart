import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/Models/products_model.dart';
import 'package:stripe_checkout/stripe_checkout.dart';

class StripeService {
  static String secretkey =
      "sk_test_51OBv2ABF3NY0si6Re7VCUDrLrfQOw3eTN2OvW7oIO2EQcJu2M5c2vSXXUcHldfxlOHpgu5cO6PHPak98YKZ2oIG100PRz3YARr";
  static String publishablekey =
      "pk_live_51OBv2ABF3NY0si6RL3ZxQFQeYPvO6yIo9XuVnejTw1ezN4CklSRJ7vGuAOSdKE07UXfjlS4nubwANJkp5SUGNw0600b6tgtLMl";

  static Future<String> createCheckoutSessions() async {
    try {
      final url = Uri.parse('https://api.stripe.com/v1/checkout/sessions');
      List<WooCommerceProduct> products = [];
      double total = 0;

      await StorageHelper().readFromFile('cart.json').then((value) {
        for (var element in value) {
          double price = 0;

          if (element.quantity != null) {
            price = double.parse(element.price!) * element.quantity!;
            total += price;
            products.add(element);
          }
        }
      });

      // Add a fixed shipping charge of $70
      total += 70;

      String lineItems = "";
      int index = 0;

      for (var element in products) {
        var productPrice =
        (double.parse(element.price!) * 100).round().toString();
        lineItems +=
        "&line_items[$index][price_data][product_data][name]=${element.name}";

        lineItems +=
        "&line_items[$index][price_data][unit_amount]=$productPrice";

        lineItems += "&line_items[$index][price_data][currency]=USD";
        lineItems +=
        "&line_items[$index][quantity]=${element.quantity.toString()}";

        index++;
      }

      // Add shipping line item
      lineItems +=
      "&line_items[$index][price_data][product_data][name]=Shipping";
      lineItems += "&line_items[$index][price_data][unit_amount]=7000"; // $70 in cents
      lineItems += "&line_items[$index][price_data][currency]=USD";
      lineItems += "&line_items[$index][quantity]=1}";

      final response = await http.post(
        url,
        body:
        'success_url=https://checkout.stripe.dev/success&mode=payment$lineItems',
        headers: {
          'Authorization': 'Bearer $secretkey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body)['id'];
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode} - ${response.body}');
        }
        throw Exception('Failed to create checkout session');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      throw Exception('An error occurred while creating a checkout session');
    }
  }

  static Future<String?> stripePaymentCheckout({
    required BuildContext context,
    required bool mounted,
    required Function onSuccess,
    required Function onCancel,
    required Function onError,
  }) async {
    try {
      final String sessionId = await createCheckoutSessions();
      final result = await redirectToCheckout(
        context: context,
        sessionId: sessionId,
        publishableKey: publishablekey,
        successUrl: "https://checkout.stripe.dev/success",
        canceledUrl: "https://checkout.stripe.dev/cancel",
      );

      if (mounted) {
        final text = result.when(
          redirected: () => "Redirected Successfully",
          success: () => onSuccess(),
          canceled: () => onCancel(),
          error: (e) => onError(e),
        );

        return text;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      throw Exception('An error occurred during payment checkout');
    }
    return null;
  }

}

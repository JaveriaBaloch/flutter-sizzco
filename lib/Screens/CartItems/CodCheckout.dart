import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/Screens/CartItems/payment_container.dart';
import 'package:sizzco/Screens/CartItems/textFlied.dart';
import 'package:sizzco/widgets/space_maker_widget.dart';

import 'numberInput.dart';

class CodCheckoutScreen extends StatefulWidget {
  const CodCheckoutScreen({Key? key}) : super(key: key);

  @override
  _CodCheckoutScreenState createState() => _CodCheckoutScreenState();
}

class _CodCheckoutScreenState extends State<CodCheckoutScreen> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController city;
  late TextEditingController state;
  late TextEditingController country;
  late TextEditingController postcode;
  late TextEditingController phone;

  String? id = '';

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    country = TextEditingController();
    phone = TextEditingController();
    postcode = TextEditingController();
    action();
  }

  static Future<String?> getString(String key) async {
    var _prefs = await SharedPreferences.getInstance();

    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  void action() async {
    await StorageHelper().readFromFile('cart.json').then((value) {
      print('Retrieved items: $value');
      setState(() {
        // value.forEach((element) {
        //
        //   // print('Adding item: $item');
        //   items.add(LineItems(
        //     productId: element.id,
        //     quantity: element.quantity,
        //     price: int.tryParse(element.price!)
        //   ));
        // });
      });
    });
  }

  // rest of the code...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 0, left: 30, right: 30),
          child: Column(
            children: [
              SpaceMaker("Checkout"),
              SizedBox(),
              TextFliedCheckoutWidget('Name', name),
              TextFliedCheckoutWidget('Email', email),
              TextFliedCheckoutWidget('Address', address),
              TextFliedCheckoutWidget('Phone', phone),
              TextFliedCheckoutWidget('City', city),
              TextFliedCheckoutWidget('State', state),
              TextFliedCheckoutWidget('Country', country),
              NumberFliedCheckoutWidget('Post code', postcode),
              PaymentMethod(
                  'assets/img_1.png',
                  "Click to Cash on Delivery",
                  "COD",
                  name,
                  email,
                  address,
                  city,
                  state,
                  country,
                  postcode,
                  phone,
                  context
                // items,
                // context,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

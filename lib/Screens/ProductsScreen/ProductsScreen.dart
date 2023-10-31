import 'package:flutter/material.dart';
import 'package:sizzco/Models/products_model.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:sizzco/widgets/bottomNav.dart';
import 'package:sizzco/widgets/discount_bar.dart';
import 'package:sizzco/widgets/main_product_image.dart';
import 'package:sizzco/widgets/shipping_cost_maker.dart';
import 'package:sizzco/widgets/small_Images.dart';

import '../../APIServices/storage.dart';
import '../../widgets/primaryText.dart';
import '../CartItems/CartScreen.dart';

class ProductScreen extends StatefulWidget {
  final WooCommerceProduct product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int imageIndex = 0;
  int quantity = 1;
  String title = "Add to cart";
  bool isAddedToWishlist = false;
  String buttonTitle = "Add to wishList";
  late WooCommerceProduct product;
  late List<WooCommerceProduct> wishlist = [];
  late List<WooCommerceProduct> cart = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
    print(product.quantity);
    check();
    if (product.quantity != null) {
      quantity = product.quantity!;
    } else {
      product.quantity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    // quantity = product.quantity;
    // quantity = product.quantity??1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainProductImage(product.images[imageIndex].src),
              SizedBox(height: 10),
              // Adding some space between the main image and the list
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(7),
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            imageIndex = index;
                          });
                        },
                        child: SmallImages(product.images[index].src));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
              Text(product.stockStatus!),
              PrimaryText(product.name!),
              PrimaryText("price:\t\$${product.price!}"),
              ShippingCostMarker(),
              SizedBox(
                height: 10,
              ),
              discountBanner(product.price!),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: AppColors.getLightPrimaryColor(),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    PrimaryText("Quantity"),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.getPrimaryColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () async {
                        if (buttonTitle == "Remove from wishlist") {
                          setState(() {
                            buttonTitle = "Add to wishlist";
                            wishlist.removeWhere(
                                (element) => element.id == product.id);
                          });
                        } else {
                          setState(() {
                            buttonTitle = "Remove from wishlist";
                            wishlist.add(product);
                          });
                        }
                        await StorageHelper.writeToFile(
                            'wishlist.json', wishlist);
                      },
                      child: Text(buttonTitle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.getPrimaryColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () async {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                                product.quantity = quantity;
                              });
                              if (title == "Remove from cart") {
                                cart.removeWhere(
                                    (element) => element.id == product.id);
                                cart.add(product);
                                await StorageHelper.writeToFile(
                                    'cart.json', cart);
                              }
                            } else if (quantity == 0) {
                              cart.removeWhere(
                                  (element) => element.id == product.id);
                              await StorageHelper.writeToFile(
                                  'cart.json', cart);
                            }
                          },
                          child: Text("-"),
                        ),
                        SizedBox(width: 15),
                        Text("${quantity}"),
                        SizedBox(width: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.getPrimaryColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () async {
                            if (quantity > 0) {
                              setState(() {
                                quantity++;
                                product.quantity = quantity;
                              });

                              if (title == "Remove from cart") {
                                cart.removeWhere(
                                    (element) => element.id == product.id);
                                cart.add(product);
                                await StorageHelper.writeToFile(
                                    'cart.json', cart);
                              }
                            } else if (quantity == 0) {
                              cart.removeWhere(
                                  (element) => element.id == product.id);
                              await StorageHelper.writeToFile(
                                  'cart.json', cart);
                            }
                          },
                          child: Text("+"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.getPrimaryColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () async {
                        if (title == "Remove from cart") {
                          setState(() {
                            title = "Add to cart";
                            cart.removeWhere(
                                (element) => element.id == product.id);
                          });
                        } else {
                          setState(() {
                            title = "Remove from cart";
                            cart.add(product);
                          });
                        }
                        await StorageHelper.writeToFile('cart.json', cart);
                      },
                      child: Text(title),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.getPrimaryColor(),
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => CartScreen()));
          // Implement your functionality here
        },
      ),
      bottomNavigationBar: NavBar(select: 2),
    );
  }

  void check() async {
    await StorageHelper().readFromFile('wishlist.json').then((value) {
      wishlist = value;
      wishlist.forEach((element) {
        if (product.id == element.id) {
          buttonTitle = "Remove from wishlist";
          return;
        }
      });
    });
    await StorageHelper().readFromFile('cart.json').then((value) {
      cart = value;
      cart.forEach((element) {
        if (product.id == element.id) {
          title = "Remove from cart";
          return;
        }
      });
    });
    setState(() {});
  }
}

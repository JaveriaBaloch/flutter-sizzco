import 'package:flutter/material.dart';
import 'package:sizzco/APIServices/storage.dart';
import 'package:sizzco/Models/products_model.dart';

import '../Utilies/colors.dart';

class WishListButton extends StatelessWidget {
  final String title;
  final WooCommerceProduct product;
  final List<WooCommerceProduct> wishlist;

  const WishListButton(this.title, this.product, this.wishlist);

  @override
  Widget build(BuildContext context) {
    final isAddedToWishlist = wishlist.contains(product);
    final buttonTitle = isAddedToWishlist ? 'Remove from Wishlist' : title;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.getPrimaryColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () async {
        if (isAddedToWishlist) {
          wishlist.remove(product);
        } else {
          wishlist.add(product);
        }
        await StorageHelper.writeToFile('wishlist.json', wishlist);
      },
      child: Text(buttonTitle),
    );
  }
}

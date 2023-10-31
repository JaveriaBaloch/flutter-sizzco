import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizzco/Models/products_model.dart';
import 'package:sizzco/Screens/ProductsScreen/ProductsScreen.dart';
import 'package:sizzco/widgets/primaryText.dart';

InkWell discountCard(
    String Imagelink,
    String title,
    String status,
    String discountPercent,
    String regularPrice,
    String discount,
    BuildContext context,
    WooCommerceProduct product) {
  bool ifGreater =
      double.parse(discount) < double.parse(regularPrice) ? true : false;
  return InkWell(
    onTap: () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ProductScreen(product: product)));
    },
    child: title != "Product"
        ? Container(
            margin: EdgeInsets.all(10),
            width: 160,
            height: 230,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.network(
                        // Use your image link here
                        Imagelink,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/img.png');
                        },
                        fit: BoxFit.cover,
                        width: 150,
                        height: 90,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          // You can replace this with your desired color
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$discountPercent%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  softWrap: true,
                  maxLines: 2,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  // maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(status),
                if (ifGreater)
                  Text(
                    '\$$regularPrice',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 10),
                  ),
                PrimaryText("\$$discount")
              ],
            ),
          )
        : SizedBox(),
  );
}

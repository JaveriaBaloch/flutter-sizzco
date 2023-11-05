import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Flutter;
import 'package:sizzco/APIServices/get_Products.dart';
import 'package:sizzco/APIServices/get_categories.dart';
import 'package:sizzco/Models/categories_model.dart';
import 'package:sizzco/Screens/Settings/settings_screen.dart';
import 'package:sizzco/Screens/search_product.dart';
import 'package:sizzco/widgets/bottomNav.dart';
import 'package:sizzco/widgets/category_cart_widget.dart';
import 'package:sizzco/widgets/searchFlied.dart';
import 'package:sizzco/widgets/space_maker_widget.dart';

import '../../Models/products_model.dart';
import '../../Utilies/colors.dart';
import 'best_rated_products.dart';
import 'day_deals.dart';
import 'flash_sales.dart';
import 'newArrivals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  late Future<List<CategoryModel>> categories;
  List<WooCommerceProduct> products = [];
  String searchtext = '';

  @override
  void initState() {
    super.initState();
    categories = GetCategories().getFeaturedForCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextSearch(controller, search, context),
              searchtext == ""
                  ? Column(children: [
                      SpaceMaker("Featured Categories"),
                      FutureBuilder<List<CategoryModel>>(
                        future: categories,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CategoryModel>> snapshot) {
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
                            // products =
                            return Wrap(
                              // spacing: 5.0,
                              // runSpacing: 10.0,
                              alignment: WrapAlignment.center,
                              children:
                              List.generate(snapshot.data!.length, (index) {
                                final category = snapshot.data![index];
                                print(category.image?.src);
                                if (category.name != "All Categories") {
                                  return CategoryCard(
                                      category.image?.src.toString() ?? '',
                                      category.name ?? '',
                                      context,
                                      category.id.toString());
                                }
                                else{
                                  return SizedBox();
                                }
                              }
                              ),
                            )
                            ;
                          }
                        },
                      )
                    ])
                  : SearchProducts(searchtext),
              SpaceMaker("Flash Sales"),
              WooCommerceProductsPage(),
              SpaceMaker("Deals on the day"),
              DayDealsProductsPage(),
              SpaceMaker("Best Rated Products"),
              BestRatedProductsPage(),
              SpaceMaker("New Arrival"),
              NewArrivalsProductsPage()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.getPrimaryColor(),
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => SettingScreen()),
          );
        },
      ),
      bottomNavigationBar: NavBar(select: 0),
    );
  }

  void search() async {
    List<WooCommerceProduct> fetchedProducts =
        await GetProductsMethods().getProductsByName(controller.text);

    setState(() {
      searchtext = controller.text;
      products = fetchedProducts;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Flutter;

import '../../APIServices/get_categories.dart';
import '../../Models/categories_model.dart';
import '../../Utilies/colors.dart';
import '../../widgets/bottomNav.dart';
import '../../widgets/category_cart_widget.dart';
import '../../widgets/searchFlied.dart';
import '../Settings/settings_screen.dart';
import '../search_product.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  late Future<List<CategoryModel>> categories;
  TextEditingController controller = TextEditingController();
  String searchtext = '';

  void initState() {
    super.initState();
    categories = GetCategories().getProductsForCategory();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextSearch(controller, search, context),
            searchtext == ""
                ? FutureBuilder<List<CategoryModel>>(
                    future: categories,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CategoryModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                        // return SizedBox(
                        // height: 300, // Set a fixed height here
                        return Wrap(
                          spacing: 5.0,
                          // runSpacing: 10.0,
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
                        );
                      }
                    },
                  )
                : SearchProducts(searchtext),
          ],
        )),
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
              MaterialPageRoute(builder: (_) => SettingScreen()));
          // Implement your functionality here
        },
      ),
      bottomNavigationBar: NavBar(
        select: 1,
      ),
    );
  }

  void search() {
    setState(() {
      searchtext = controller.text;
    });
  }
}

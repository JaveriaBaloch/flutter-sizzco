import 'package:flutter/material.dart';
import 'package:sizzco/Screens/CartItems/CartScreen.dart';
import 'package:sizzco/Screens/CategoryScreen/category_screen.dart';
import 'package:sizzco/Screens/SavedItems/savedItems_screen.dart';
import 'package:sizzco/Screens/home_screen/home_screen.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavBar extends StatefulWidget {
  final int select;

  const NavBar({Key? key, required this.select}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Color navigationBarColor = Colors.white;
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.select;
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WaterDropNavBar(
      backgroundColor: Colors.white,
      inactiveIconColor: AppColors.getPrimaryColor(),
      waterDropColor: AppColors.getPrimaryColor(),
      onItemSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
        check(index);
      },
      selectedIndex: selectedIndex,
      barItems: <BarItem>[
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
          filledIcon: Icons.landscape,
          outlinedIcon: Icons.landscape_outlined,
        ),
        BarItem(
          filledIcon: Icons.shopping_basket,
          outlinedIcon: Icons.shopping_basket_outlined,
        ),
        BarItem(
          filledIcon: Icons.favorite_rounded,
          outlinedIcon: Icons.favorite_border_rounded,
        ),
      ],
    );
  }

  void check(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => CategoryScreen()),
        );
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => CartScreen()),
        );
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => SavedItems()),
        );
        break;
      default:
        break;
    }
  }
}

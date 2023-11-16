import 'package:flutter/material.dart';
import 'package:sizzco/Screens/splash_screen.dart';

import 'Screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

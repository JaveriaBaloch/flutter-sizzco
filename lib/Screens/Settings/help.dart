import 'package:flutter/material.dart';
import 'package:sizzco/Screens/Settings/settings_screen.dart';
import 'package:sizzco/Utilies/colors.dart';

import '../../widgets/bottomNav.dart';
import '../../widgets/help_container.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            children: [
              HelpContainer(
                  "+1 (307) 269-5972",
                  "Phone Number",
                  Icon(
                    Icons.call,
                    color: AppColors.getPrimaryColor(),
                    size: 30,
                  )),
              HelpContainer(
                  "+1 (307) 269-5972",
                  "WhatsApp",
                  Icon(
                    Icons.wifi_calling_3_outlined,
                    color: AppColors.getPrimaryColor(),
                    size: 30,
                  )),
              HelpContainer(
                  "support@sizzco.com",
                  "Email",
                  Icon(
                    Icons.attach_email,
                    color: AppColors.getPrimaryColor(),
                    size: 30,
                  ))
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
              MaterialPageRoute(builder: (_) => SettingScreen()));
          // Implement your functionality here
        },
      ),
      bottomNavigationBar: NavBar(select: 5),
    );
  }
}

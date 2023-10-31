import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizzco/Screens/Login/user_login.dart';
import 'package:sizzco/Screens/Settings/about.dart';
import 'package:sizzco/Screens/Settings/help.dart';
import 'package:sizzco/Screens/Settings/privary_screen.dart';
import 'package:sizzco/Screens/Settings/terms_and_conditions_screen.dart';
import 'package:sizzco/widgets/primaryText.dart';

import '../../widgets/bottomNav.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? username, email, token = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  // Save preferences
  static Future<void> saveString(String key, String value) async {
    var _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

// Get preferences
  static Future<String?> getString(String key) async {
    var _prefs = await SharedPreferences.getInstance();

    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: ListView(
            children: [
              // User card
              Container(
                height: 150,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/avatarr.png",
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    username != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(username!),
                              SizedBox(
                                height: 7,
                              ),
                              Text(email!)
                            ],
                          )
                        : InkWell(
                            child: PrimaryText("Click to Login"),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()));
                            },
                          )
                  ],
                ),
              ),
              SettingsGroup(
                settingsGroupTitle: "Info",
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => PrivaryScreen()));
                    },
                    icons: Icons.privacy_tip,
                    iconStyle: IconStyle(),
                    title: 'Our Privacy Policy',
                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => TermsAndConditions()));
                    },
                    icons: CupertinoIcons.text_badge_checkmark,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Terms and Conditions',
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Others",
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => AboutScreen()));
                    },
                    icons: Icons.people,
                    iconStyle: IconStyle(backgroundColor: Colors.purple),
                    title: 'About',
                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HelpScreen()));
                    },
                    icons: Icons.help,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.grey,
                    ),
                    title: 'Help',
                  ),
                ],
              ),
              // You can add a settings title
              username != null
                  ? SettingsGroup(
                      items: [
                        SettingsItem(
                          onTap: () {
                            signOut();
                          },
                          icons: Icons.exit_to_app_rounded,
                          title: "Sign Out",
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(select: 5),
    );
  }

  void check() async {
    email = await getString('email');
    username = await getString('name');
    token = await getString('token');
    setState(() {});
  }

  void signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('name');
    await prefs.remove('id');
    await prefs.remove('token');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    setState(() {});
  }
}

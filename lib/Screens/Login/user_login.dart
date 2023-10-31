import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizzco/APIServices/get_Users.dart';
import 'package:sizzco/Screens/Login/Register.dart';
import 'package:sizzco/Screens/home_screen/home_screen.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:sizzco/widgets/primaryText.dart';

import '../../widgets/textFlied.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    bool userModel = await GetUsers().login(username.text, password.text);
    if (userModel) {
      Fluttertoast.showToast(
        msg: "successful login!",
        timeInSecForIosWeb: 4,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      Fluttertoast.showToast(
        msg: "Oops, Invalid Login!",
        timeInSecForIosWeb: 4,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/applogo.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              TextFliedWidget(
                  "Username",
                  username,
                  Icon(
                    Icons.person,
                    color: AppColors.getPrimaryColor(),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFliedWidget(
                  "Password",
                  password,
                  Icon(
                    Icons.lock,
                    color: AppColors.getPrimaryColor(),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: AppColors.getPrimaryColor()),
                  ),
                  onPrimary: Colors.black,
                  elevation: 5,
                ),
                onPressed: () {
                  // Add your onPressed callback here
                  if (username.text.isEmpty && username.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'All Fields are required',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                  } else {
                    login();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: PrimaryText("Create an account"),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String message) {
    FlutterToastr.show(message, context,
        duration: 4, position: FlutterToastr.bottom);
  }
}

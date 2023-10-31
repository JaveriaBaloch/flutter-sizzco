import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizzco/APIServices/get_Users.dart';
import 'package:sizzco/Models/RegisterModel.dart';
import 'package:sizzco/Screens/Login/user_login.dart';
import 'package:sizzco/Screens/home_screen/home_screen.dart';

import '../../Utilies/colors.dart';
import '../../widgets/primaryText.dart';
import '../../widgets/textFlied.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  void register() async {
    String? check = validateFields();
    UserRegister userRegister = new UserRegister();
    if (check != null) {
      Fluttertoast.showToast(
        msg: check,
        timeInSecForIosWeb: 4,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      userRegister.userName = username.text;
      userRegister.email = email.text;
      UserResponseModel msg =
          await GetUsers().register(username.text, email.text, password.text);
      Fluttertoast.showToast(
        msg: "${msg.message!}, Now Please Login!",
        timeInSecForIosWeb: 4,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      if (msg.code == 200) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      }
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
                  "Email",
                  email,
                  Icon(
                    Icons.alternate_email_outlined,
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
              TextFliedWidget(
                  "Confirm Password",
                  confirmPassword,
                  Icon(
                    Icons.confirmation_num,
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
                  register();
                  // Add your onPressed callback here
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Register',
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
                child: PrimaryText("Login"),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateUsername(String username) {
    // Regex for username (alphanumeric with underscores)
    RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
    return regex.hasMatch(username);
  }

  bool validateEmail(String email) {
    // Regex for email
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool validatePassword(String password) {
    // Regex for password (minimum eight characters, at least one letter, one number, and one special character)
    RegExp regex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    return regex.hasMatch(password);
  }

  String? validateFields() {
    if (!validateUsername(username.text)) {
      return 'Invalid username. Please use only letters, numbers, and underscores.';
    }

    if (!validateEmail(email.text)) {
      return 'Invalid email address.';
    }

    if (!validatePassword(password.text)) {
      return 'Invalid password. Password must be at least 8 characters long and contain at least one letter and one number.';
    }

    if (password.text != confirmPassword.text) {
      return 'Passwords do not match.';
    }

    return null; // Return null if all fields are valid
  }
}

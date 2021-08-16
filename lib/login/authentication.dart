import 'package:flutter/material.dart';
import 'package:spinther/login/loginPage.dart';
import 'package:spinther/login/registerPage.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToogle = false;
  void toogleScreen() {
    setState(() {
      isToogle = !isToogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToogle) {
      return RegisterPage(toogleScreen: toogleScreen);
    } else {
      return LoginPage(toogleScreen: toogleScreen);
    }
  }
}

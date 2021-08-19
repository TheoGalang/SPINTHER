import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spinther/home_page/homePage.dart';
import 'package:spinther/home_page/griddashboard.dart';
import 'package:spinther/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String defUsername = 'admin';
  String defPassword = '123';

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Image.asset(
                'assets/image/UP.png',
                height: 128,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: TextFormField(
                controller: usernameControler,
                decoration: InputDecoration(hintText: 'Username'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                onPressed: () {
                  if (login(usernameControler.text, passwordController.text)) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    final snackBar = SnackBar(content: Text('Login Failed'));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('LOGIN'),
              ),
            ),
            Container(
              child: Text(
                'Belum memiliki akun?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                  child: Text(
                'Daftar Disini',
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ));
  }

  bool login(String username, String password) {
    return username == defUsername && password == defPassword;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spinther/homePage.dart';
import 'package:spinther/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String defUsername = 'asd';
  String defPassword = 'asdf1234';

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tutorial App'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
              child: Text('Belum memiliki akun?'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(child: Text('Daftar Disini')),
            )
          ],
        ));
  }

  bool login(String username, String password) {
    return username == defUsername && password == defPassword;
  }
}

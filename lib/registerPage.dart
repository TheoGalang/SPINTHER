import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Daftar'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 100, bottom: 25),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Nama Lengkap*'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 25),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Email*'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 25),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password*'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Email Orang Tua'),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 25), child: Text('* Wajib Diisi')),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('SIGN UP'),
            ),
          )
        ],
      ),
    );
  }
}

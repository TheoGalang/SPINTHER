import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

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
              decoration: InputDecoration(
                hintText: 'Nama Lengkap*',
                errorText: _validate ? 'This Field Can\'t Be Empty' : null,
              ),
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
              decoration: InputDecoration(
                hintText: 'Password*',
                //errorText: _validate ? 'This Field Can\'t Be Empty' : null,
              ),
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
              onPressed: () {
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              child: Text('SIGN UP'),
            ),
          )
        ],
      ),
    );
  }
}

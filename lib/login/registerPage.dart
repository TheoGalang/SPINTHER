import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinther/firebase/auth_services.dart';
import 'package:spinther/login/enums.dart';

class RegisterPage extends StatefulWidget {
  final Function toogleScreen;
  const RegisterPage({Key? key, required this.toogleScreen}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  accountType? _type = accountType.user;
  final _text = TextEditingController();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _namaController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _namaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _namaController.dispose();
    _text.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Colors.lightBlue,
            Color.fromRGBO(255, 237, 218, 10),
          ],
        )),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 100, bottom: 25),
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: TextFormField(
                  controller: _namaController,
                  validator: (val) =>
                      val!.isEmpty ? 'This Field Can\'t Be Empty' : null,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap*',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25),
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: TextFormField(
                  controller: _emailController,
                  validator: (val) =>
                      val!.isEmpty ? "Please insert email address" : null,
                  decoration: InputDecoration(hintText: 'Email*'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25),
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) => val!.isEmpty || val.length < 8
                      ? "Must be 8 character"
                      : null,
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
                  margin: EdgeInsets.only(top: 25),
                  child: Text('* Wajib Diisi')),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginProvider.register(_emailController.text.trim(),
                          _passwordController.text.trim());
                    }
                  },
                  child: Text('SIGN UP'),
                ),
              ),
              Container(
                child: Text('Sudah memiliki akun?'),
              ),
              InkWell(
                onTap: () {
                  widget.toogleScreen();
                },
                child: Container(child: Text('Login Disini')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinther/firebase/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function toogleScreen;
  const LoginPage({Key? key, required this.toogleScreen}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Image.asset(
                      'assets/image/UP.png',
                      // height: 128,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await loginProvider.login(
                              _emailController.text.trim(),
                              _passwordController.text.trim());
                        }
                      },
                      child: Text('LOGIN'),
                    ),
                  ),
                  Container(
                    child: Text('Belum memiliki akun?'),
                  ),
                  InkWell(
                    onTap: () {
                      widget.toogleScreen();
                    },
                    child: Container(child: Text('Daftar Disini')),
                  ),
                  if (loginProvider.errorMessage != null)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(loginProvider.errorMessage!),
                        leading: Icon(Icons.error),
                        trailing: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => loginProvider.setMessage(null),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

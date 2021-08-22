import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinther/firebase/auth_services.dart';
import 'package:spinther/home_page/homePage.dart';
import 'package:spinther/login/authentication.dart';
import 'package:spinther/login/loginPage.dart';
import 'package:spinther/login/wrapper.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  bool showPassword = false;
  bool isToogle = false;
  void toogleScreen() {
    setState(() {
      isToogle = !isToogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);

    Future<void> showInformationDialog(BuildContext context) async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Are you sure you want to logout?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      loginProvider.logout();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Wrapper()),
                          (route) => false);
                    },
                    child: Text("LOG OUT"))
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () async {
              await showInformationDialog(context);
            },
          ),
        ],
      ),
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
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Name", "Spinther", false),
                buildTextField("Email", "Spinther", false),
                buildTextField("Password", "*******", true),
                buildTextField("Diary Pin", "****", true),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "SAVE",
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 2),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

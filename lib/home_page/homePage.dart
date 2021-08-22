//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinther/diary_page/diaryLogin.dart';
import 'package:spinther/firebase/auth_services.dart';
import 'package:spinther/spinWheel_page/spinWheel.dart';
import 'package:spinther/home_page/griddashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      backgroundColor: Colors.blue[600],
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 110,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Halo, SPINTHER",
                        style: (TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        )),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GridDashboard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loginProvider.logout();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

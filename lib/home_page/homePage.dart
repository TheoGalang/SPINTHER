import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spinther/diary_page/diaryLogin.dart';
import 'package:spinther/firebase/auth_services.dart';
import 'package:spinther/spinWheel.dart';
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
      appBar: AppBar(
        leading: new Container(),
        backgroundColor: Colors.blueGrey,
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await loginProvider.logout();
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      backgroundColor: Color(0xff0D47A1),
      body: Column(
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
                      "Halo SPINTHER",
                      style: (TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: (TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
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
    );
  }
}

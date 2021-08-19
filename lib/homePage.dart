import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase/auth_services.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('Game Spin')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('Quiz')
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('Diary')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('About Bullying')
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('Contact')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/UP.png',
                        height: 128,
                        width: 128,
                      ),
                      Text('Settings')
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
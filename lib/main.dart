import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spinther/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,

      //   children: [
      //     Column(

      //       children: [
      //         Expanded(
      //           flex: 2,
      //           child:
      //           Column(
      //             children: [
      //               Image.asset('assets/image/UP.png', height: 120,
      //               ),
      //               SizedBox(height: 20,
      //         ),
      //               Padding(padding: const
      //                 EdgeInsets.symmetric(horizontal: 100
      //           ),
      //             child: LinearProgressIndicator(
      //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      //             ),
      //         ),
      //             ],
      //           ),
      //         ),

      //         Expanded(
      //           flex: 1,
      //           child: Container(

      //             child: Text('Putar Spinboard dan mainkan misinya'),
      //           ),
      //         )
      //       ],
      //     )
      // ],),
      body: LoginPage(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/image/UP.png',
      //         height: 120,
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 100),
      //         child: LinearProgressIndicator(
      //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      //         ),
      //       ),
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Container(
      //             padding: EdgeInsets.only(top: 50),
      //             child: Text('Putar Spinboard dan mainkan misinya!'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

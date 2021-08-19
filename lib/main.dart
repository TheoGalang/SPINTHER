import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinther/diary_page/diaryLogin.dart';
import 'package:spinther/firebase/auth_services.dart';
import 'package:spinther/login/authentication.dart';
import 'package:spinther/login/loginPage.dart';
import 'package:spinther/login/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget();
          } else if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: AuthServices()),
                StreamProvider.value(
                    value: AuthServices().user, initialData: null)
              ],
              child: MaterialApp(
                theme: ThemeData(primarySwatch: Colors.red),
                home: Wrapper(),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [Icon(Icons.error), Text('Somenthing wrong !!!')],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Authentication()));
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
      // body: LoginPage(),
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

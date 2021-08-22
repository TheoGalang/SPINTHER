import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spinther/diary_page/diaryList.dart';
import 'package:spinther/utils_widget/customappbar.dart';

class DiaryLogin extends StatefulWidget {
  const DiaryLogin({Key? key}) : super(key: key);

  @override
  _DiaryLoginState createState() => _DiaryLoginState();
}

class _DiaryLoginState extends State<DiaryLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: OtpScreen(),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = InputDecoration(
    contentPadding: EdgeInsets.all(16.0),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
  );

  int pinIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/image/diaryLogo.png"),
          ),
          Container(
            alignment: Alignment(0, 0.5),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSecurityText(),
                SizedBox(height: 30.0),
                buildPinRow(),
              ],
            ),
          ),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
        child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardNumber(
                        n: 1,
                        onPressed: () {
                          pinIndexSetup("1");
                        },
                      ),
                      KeyboardNumber(
                        n: 2,
                        onPressed: () {
                          pinIndexSetup("2");
                        },
                      ),
                      KeyboardNumber(
                        n: 3,
                        onPressed: () {
                          pinIndexSetup("3");
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardNumber(
                        n: 4,
                        onPressed: () {
                          pinIndexSetup("4");
                        },
                      ),
                      KeyboardNumber(
                        n: 5,
                        onPressed: () {
                          pinIndexSetup("5");
                        },
                      ),
                      KeyboardNumber(
                        n: 6,
                        onPressed: () {
                          pinIndexSetup("6");
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyboardNumber(
                        n: 7,
                        onPressed: () {
                          pinIndexSetup("7");
                        },
                      ),
                      KeyboardNumber(
                        n: 8,
                        onPressed: () {
                          pinIndexSetup("8");
                        },
                      ),
                      KeyboardNumber(
                        n: 9,
                        onPressed: () {
                          pinIndexSetup("9");
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60.0,
                        child: MaterialButton(
                          height: 60.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiaryList()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Image.asset(
                            "assets/image/done.png",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      KeyboardNumber(
                        n: 0,
                        onPressed: () {
                          pinIndexSetup("0");
                        },
                      ),
                      Container(
                        width: 60.0,
                        child: MaterialButton(
                          height: 60.0,
                          onPressed: () {
                            clearPin();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Image.asset(
                            "assets/image/delete.png",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  clearPin() {
    if (pinIndex == 0) {
      // setPin(pinIndex, "");
      setState(() {
        pinIndex = 0;
      });
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      setState(() {
        pinIndex--;
      });
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      setState(() {
        pinIndex--;
      });
    }
    print(pinIndex);
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 4) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Masukkan PIN",
      style: TextStyle(
        color: Colors.blue[800],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final InputDecoration outlineInputBorder;

  PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: outlineInputBorder,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.blue[800]),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({required this.n, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white.withOpacity(0.4),
        ),
        alignment: Alignment.center,
        child: MaterialButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            height: 90.0,
            child: Text(
              "$n",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )));
  }
}

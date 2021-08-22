import 'dart:math';

import 'package:flutter/material.dart';

class WriteDiary extends StatefulWidget {
  const WriteDiary({Key? key}) : super(key: key);

  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

Color color = Colors.white;
List colors = [Colors.red[100], Colors.green[300], Colors.yellow[100]];
Random random = new Random();
int index = 0;

class _WriteDiaryState extends State<WriteDiary> {
  @override
  Widget build(BuildContext context) {
    void changeIndex() {
      setState(() => index = random.nextInt(3));
    }

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(
          'My Diary',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/image/smile.png'),
                                    Text(
                                      'Happy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/image/sad.png'),
                                    Text(
                                      'Sad',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/image/angry.png',
                                    ),
                                    Text(
                                      'Angry',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/image/love.png'),
                                    Text(
                                      'Love',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/image/vn.png'),
                                    Text(
                                      'Voice',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/image/photo.png',
                                      height: 50,
                                    ),
                                    Text(
                                      'Photo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: GestureDetector(
                                onTap: () => setState(() =>
                                    color = colors[index = random.nextInt(3)]),
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset('assets/image/palet.png'),
                                      Text(
                                        'Color',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 70,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/image/lock.png',
                                      height: 50,
                                    ),
                                    Text(
                                      'Save',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            // flex: ,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

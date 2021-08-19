import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'customFortuneItem.dart';

class spinWheel extends StatefulWidget {
  const spinWheel({Key? key}) : super(key: key);

  @override
  _spinWheelState createState() => _spinWheelState();
}

class _spinWheelState extends State<spinWheel> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'color': Colors.red,
        'image': Icon(Icons.business_center),
        'title': 'Business Center'
      },
      {'color': Colors.blue, 'image': Icon(Icons.house), 'title': 'House'},
      {
        'color': Colors.green,
        'image': Icon(Icons.travel_explore),
        'title': 'Travel'
      },
      {
        'color': Colors.yellow,
        'image': Icon(Icons.computer),
        'title': 'Computer'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () {
          // setState(() {
          //   selected.add(
          //     Fortune.randomInt(0, items.length),
          //   );
          // });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items)
                    FortuneItem(
                        style: FortuneItemStyle(
                            borderColor: Colors.white,
                            color: it['color'] as Color),
                        child: customFortuneItem(it)),
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(0, items.length),
                    );
                  });
                },
                child: Text('Push Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

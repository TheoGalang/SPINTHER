import 'package:flutter/material.dart';

Column customappbar(String tittle, BuildContext context) {
  return Column(
    children: [
      Container(
        color: Colors.blue,
        height: 14,
      ),
      Container(
        alignment: Alignment.bottomCenter,
        height: 72,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
        color: Colors.blue,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(tittle,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

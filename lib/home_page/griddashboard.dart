import 'package:flutter/material.dart';
import 'package:spinther/diary_page/diaryLogin.dart';
import 'package:spinther/editProfile.dart';
import 'package:spinther/spinWheel_page/spinWheel.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
      title: "Game Spin",
      // subtitle: "March, Wednesday",
      // event: "3 Events",
      img: "assets/image/done.png",
      changePage: spinWheel());

  Items item2 = new Items(
    title: "Quiz",
    // subtitle: "Bocali, Apple",
    // event: "4 Items",
    img: "assets/image/done.png",
    changePage: spinWheel(),
  );

  Items item3 = new Items(
      title: "Diary",
      // subtitle: "Lucy Mao going to Office",
      // event: "",
      img: "assets/image/done.png",
      changePage: DiaryLogin());

  Items item4 = new Items(
      title: "About Bullying",
      // subtitle: "Rose favorited your Post",
      // event: "",
      img: "assets/image/done.png",
      changePage: spinWheel());

  Items item5 = new Items(
      title: "Chat",
      // subtitle: "Homework, Design",
      // event: "4 Items",
      img: "assets/image/done.png",
      changePage: spinWheel());

  Items item6 = new Items(
      title: "Settings",
      // subtitle: "",
      // event: "2 Items",
      img: "assets/image/done.png",
      changePage: editProfile());

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xFF42A5F5;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.changePage));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 249, 249, 50),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 56,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      data.title,
                      style: (TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Text(
                    //   data.subtitle,
                    //   style: GoogleFonts.openSans(
                    //       textStyle: TextStyle(
                    //           color: Colors.white38,
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.w600)),
                    // ),
                    SizedBox(
                      height: 14,
                    ),
                    // Text(
                    //   data.event,
                    //   style: GoogleFonts.openSans(
                    //       textStyle: TextStyle(
                    //           color: Colors.white70,
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.w600)),
                    // ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  Widget changePage;
  String title;
  // String subtitle;
  // String event;
  String img;
  Items({required this.title, required this.img, required this.changePage});
}

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:spinther/diary_page/writeDiary.dart';

List _dataDummy = [
  {
    "id": 1,
    "title": "Pengalaman masuk SMA pertamaku",
    "date": "2020-01-01",
    "icon": "assets/image/smile.png"
  },
  {
    "id": 2,
    "title": "Pengalaman masuk SMA pertamaku",
    "date": "2020-01-10",
    "icon": "assets/image/smile.png"
  },
  {
    "id": 3,
    "title": "Pengalaman masuk SMA pertamaku",
    "date": "2020-02-01",
    "icon": "assets/image/smile.png"
  },
  {
    "id": 4,
    "title": "Pengalaman masuk SMA pertamaku",
    "date": "2020-02-03",
    "icon": "assets/image/smile.png"
  },
  {
    "id": 5,
    "title": "Pengalaman masuk SMA pertamaku",
    "date": "2020-04-01",
    "icon": "assets/image/smile.png"
  },
];

class DiaryList extends StatefulWidget {
  const DiaryList({Key? key}) : super(key: key);

  @override
  _DiaryListState createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id', null);
    return Scaffold(
      // backgroundColor: Colors.blue[600],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'My List Diary',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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
        child: GroupedListView<dynamic, String>(
          elements: _dataDummy,

          groupBy: (element) => DateFormat('MMMM, yyyy', 'ID').format(
            DateTime.parse(element['date']),
          ),
          groupSeparatorBuilder: (String groupByValue) => Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    groupByValue,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          itemBuilder: (context, dynamic element) {
            return Card(
              color: Colors.white70,
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: Image.asset(
                          element['icon'],
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['title'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemComparator: (item1, item2) =>
              item1['title'].compareTo(item2['title']), // optional
          useStickyGroupSeparators: false, // optional
          floatingHeader: false, // optional
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WriteDiary()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var list = [
  {"icon": Icons.radio, "name": "radio"},
  {"icon": Icons.spa, "name": "spa"},
  {"icon": Icons.business, "name": "business"},
  {"icon": Icons.work, "name": "work"},
  {"icon": Icons.ac_unit, "name": "ac"},
  {"icon": Icons.access_alarm, "name": "alarm"},
  {"icon": Icons.accessibility, "name": "people"},
  {"icon": Icons.account_balance, "name": "account"},
  {"icon": Icons.airport_shuttle, "name": "shuttle"},
  {"icon": Icons.audiotrack, "name": "audiotrack"},
  {"icon": Icons.beach_access, "name": "beach"},
  {"icon": Icons.bluetooth, "name": "bluetooth"},
];

class Dashboard extends StatefulWidget {
  Dashboard(this.listType);
  final String listType;
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Center(
              child: new CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: Text("Discover",
                  style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold)),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.grey[800],
                ),
              ],
              forceElevated: innerBoxIsScrolled,
              pinned: false,
              floating: true,
              snap: true,
            ),
          ];
        },
        body: futureBuilder,
      ),
    );
  }

  Future<List<String>> _getData() async {
    var values = new List<String>();
    values.add("Horses");
    values.add("Goats");
    values.add("Chickens");

    return values;
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer timer = new Timer(new Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new RefreshIndicator(
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                  // you may want to use an aspect ratio here for tablet support
                  height: 300.0,
                  width: 410.0,
                  child: PageView(
                    children: <Widget>[
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn-images-1.medium.com/max/1600/1*S14dilWfJSxptxuU9F6YEA.jpeg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: (Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text("Donate your preloved",
                                      style: new TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 3.0),
                                  ),
                                  Text(
                                      "Join the community and give away your unused item",
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.w300)),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 3.0),
                                  ),
                                  OutlineButton(
                                     highlightedBorderColor: Colors.white,
                                    borderSide: BorderSide(width: 2.0, color: Colors.white),
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      child: const Text('POST',
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                ],
                              ))),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          'https://placeimg.com/640/480/any',
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          'https://placeimg.com/640/480/any',
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, top: 30.0),
            child: Text("Category",
                style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              height: 100,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var item in list)
                    Container(
                      width: 70.0,
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => {},
                            child: Icon(item["icon"], color: Colors.pink),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                          ),
                          Text(item["name"])
                        ],
                      ),
                    ),
                ],
              )),
          Container(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Text("Latest",
                style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 2,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(4, (index) {
                return Container(
                  child: Card(
                    elevation: 0.0,
                    color: Color(0xFFFFFF),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
//                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network(
                            'https://picsum.photos/250?image=9',
                            height: 120,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "LAPTOP . NEVOVO",
                              style: new TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "Lenovo P20X",
                              style: new TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "PUTRAJAYA",
                              style: new TextStyle(fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 23.0),
            child: Text("Nearby",
                style:
                    new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 2,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(4, (index) {
                return Container(
                  child: Card(
                    elevation: 0.0,
                    color: Color(0xFFFFFF),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network(
                            'https://picsum.photos/250?image=9',
                            height: 120,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "LAPTOP . NEVOVO",
                              style: new TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "Lenovo P20X",
                              style: new TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "PUTRAJAYA",
                              style: new TextStyle(fontSize: 13.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      onRefresh: _onRefresh,
    );
  }
}

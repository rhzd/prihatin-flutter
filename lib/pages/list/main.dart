import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList(this.listType);
  final String listType;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: DefaultTabController(
        length: 9,
        child: new Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text("Store",
                      style:
                      new TextStyle(fontSize: 30.0, color: Colors.grey[800], fontWeight: FontWeight.bold)),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                      color: Colors.grey[800],
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                      color: Colors.grey[800],
                    ),
                  ],
                  forceElevated: innerBoxIsScrolled,
                  pinned: false,
                  floating: true,
                  snap: true,
                  bottom: new TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.pink,
                    labelColor: Colors.pink,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Tab>[
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                      Tab(text: 'test'),
                    ],
                  ),
                ),
              ];
            },
            body: new TabBarView(
              children: <Widget>[
                _list(),
                _list(),
                _list(),
                _list(),
                _list(),
                _list(),
                _list(),
                _list(),
                _list(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _list(){
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 250,
        itemBuilder: (context, index){
          return Container(
            color: Colors.grey[200].withOpacity((index % 2).toDouble()),
            child: ListTile(
              title: Text(index.toString()),
            ),
          );
        }
    );
  }
}
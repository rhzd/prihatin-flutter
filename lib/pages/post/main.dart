import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post(this.listType);
  final String listType;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Card(
          elevation: 10.0,
          margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 280.0, bottom: 295.0),
          child: new ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom:10.0),
                child: RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  onPressed: () {},
                  child: Text('Something i need',  style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0),
                child: RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  onPressed: () {},
                  child: Text('Something to give',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

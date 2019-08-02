import 'package:flutter/material.dart';
import 'package:aplikasi/pages/dashboard/main.dart';
import 'package:aplikasi/pages/profile/main.dart';
import 'package:aplikasi/pages/list/main.dart';
import 'package:aplikasi/pages/location.dart';
import 'package:aplikasi/pages/post/main.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new Dashboard('Dashboard'),
    new ItemList('List'),
    new Post('Post'),
    new Location('Location'),
    new Profile('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Find'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favourite')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.forum),
              title: Text('Message')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Me')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

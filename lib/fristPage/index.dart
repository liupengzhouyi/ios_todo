
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      new MyApp()
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Dome(),
    );
  }
}


class Dome extends StatelessWidget {

  List<BottomNavigationBarItem> list = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm),
      title: new Text("123"),
    ),
  ],

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "首页",
          style: new TextStyle(
            fontSize: 45,
          ),
        ),
      ),
      body: new Text("paly"),
      bottomNavigationBar: new CupertinoTabBar(
        activeColor: Colors.amberAccent,
        items: list,

      ),
    );
  }
}


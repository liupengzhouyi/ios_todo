/*
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('_TestPageState.build');
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: 0),
        color: Colors.white,
//        child: Container(color: Colors.red,child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: TextField(),
//        ),),
        child: ListView(
          children: <Widget>[TextField()],
        ),
      ),
      appBar: AppBar(
        leading: Container(),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              })
        ],
      ),
    );
  }
}
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp(
    items: new List<String>.generate(10000, (i) => "Item $i"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

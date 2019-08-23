
import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyList(),
    );
  }
}


class MyList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new ListView(
          children: createList(),
        ),
      ),
    );
  }


  List<Widget> createList() {
    List<Widget> list = new List<Widget>();
    for (int i=0;i<10;i++) {
      list.add(createContainer(i));
    }
    return list;
  }

  Widget createContainer(int index) {
    return new Container(
      width: 1150.0,
      child: new ListTile(
        // 显示在title之前
        leading: new Icon(Icons.account_circle),

        title: new Text("${index}"),
        subtitle:new Text("我是${index}") ,
        // 显示在title之后
        trailing: new Icon(Icons.add_circle_outline),
      ),
    );
  }
}













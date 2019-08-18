import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'bus.dart';
import 'newPaly1.dart';

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
      home: Main_Page(),
    );
  }
}


class Main_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Event_Bus_Demo'),
        ),
        body:Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //两个页面为兄弟组件
                First_Page(),
                Second_Page(),
              ],
            ),
          ),
        )
    );
  }
}

class First_Page extends StatelessWidget {
  String text = '我是触发事件,通过Bus传递';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          //Bus触发事件
          eventBus.fire(new UserLoggedInEvent(text));
        },
        child: RaisedButton(
          child: Text('点击我触发'),
        ),
      ),
    );
  }
}



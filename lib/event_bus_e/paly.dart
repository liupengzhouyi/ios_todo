import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:event_bus/event_bus.dart';
import 'package:ios_todo/event_bus_e/newPaly.dart';

import 'bus.dart';

void main(){
  // AMapLocationClient.setApiKey("5fa948fc7dccd87dd1b0237bad511490");
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
      home: MyHomePage(title: '刘鹏的专用App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //Bus触发事件
      eventBus.fire(new UserLoggedInEvent("" + _counter.toString()));

      // 引用监听事件，重新渲染页面
      _listen();

      _counter++;

      if (_counter == 10) {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          //指定跳转的页面
          return new Main_Page();
        },));
      }
    });
  }

  var aaa = "123";

  //监听Bus events
  void _listen(){
    eventBus.on<UserLoggedInEvent>().listen((event){
      setState(() {
        aaa = event.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //_incrementCounter();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${aaa}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

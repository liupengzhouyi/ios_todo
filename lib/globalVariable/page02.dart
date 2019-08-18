import 'package:flutter/material.dart';
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
      home: MyHomePage2(title: '刘鹏的专用App02'),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {

  // int _counter = 0;

  @override
  void initState() {
    eventBus.on<UserLoggedInEvent>().listen((event){
      event.text = '第二个页面';
      print(event.getNumber());
      if (event.getNumber() != -1) {
        setState(() {
          counter = event.getNumber();
        });
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      counter = counter + 1;
    });
    eventBus.fire(new UserLoggedInEvent(counter));
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
              '$counter',
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

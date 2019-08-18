import 'package:flutter/material.dart';


import 'bus.dart';

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
      home: MyHomePage4(title: '刘鹏的专用App03'),
    );
  }
}

class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage4> {

  // int _counter = 0;

  @override
  void initState() {
    eventBus.on<UserLoggedInEvent>().listen((event){
      event.text = '第三个页面';
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





import 'dart:async';

import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/calculationDistance/CalculationDistanceByCoordinates.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';
import 'package:ios_todo/gaodeMap/positioning/GetLocation.dart';

import 'package:ios_todo/gaodeMap/positioning/ListenLocation.dart';
import 'package:ios_todo/gaodeMap/test/paly.dart';

void main(){
  AMapLocationClient.setApiKey("5fa948fc7dccd87dd1b0237bad511490");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '刘鹏的专用App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      countdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
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

  void countdown(){
    Timer countdownTimer =  new Timer.periodic(new Duration(seconds: 1), (timer) {
      print('----');
      paly01();
    });
  }

  // 测试的初级版本
  void paly00() async{
    String string = "";
    AMapLocation loc;
    await AMapLocationClient.startup(new AMapLocationOption(desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    loc = await AMapLocationClient.getLocation(true);
    print(loc);
    if (loc == null) {
      string =  "正在定位";
    }
    if (loc.isSuccess()) {
      if (loc.hasAddress()) {
        string = "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
      } else {
        string = "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
      }
    } else {
      string = "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
    }
    print(string);
  }

  // 直接定位测试模块
  void paly01() async {
    GetLocation getLocation = new GetLocation();
    await getLocation.function();
    print(getLocation.getPositioningResults());
    print(getLocation.getCoordinates().toString());
    Coordinates start = new Coordinates(116.368904, 39.923423);
    Coordinates end = new Coordinates(116.387271, 39.922501);
    print("------俩个定位坐标的距离--start---");
    print("距离是" + new CalculationDistanceByCoordinates(start, end).calculationDistance());
    print("------俩个定位坐标的距离--end---");
  }

  // 监听定位测试模块
  void paly02() async {
    this.listenLocation = new ListenLocation();
    await listenLocation.funcation();
    setState(() {
      this.aMapLocation = listenLocation.aMapLocation;
    });
    /*print(listenLocation.getCoordinates());
    print(listenLocation.getPositioningResults());*/

    print('----------');
    print(this.aMapLocation.latitude);
    print('----------');
  }

  void paly02Stop() {
    listenLocation.stopListenLocation();
  }

  void paly03() async {
    LocationListen locationListen = new LocationListen();

  }

  ListenLocation listenLocation;
  AMapLocation aMapLocation;
}

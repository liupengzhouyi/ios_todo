import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/calculationDistance/CalculationDistanceByCoordinates.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';
import 'package:ios_todo/gaodeMap/positioning/FalseListeningLocation.dart';
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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      paly04();
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
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

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

  void paly04() async {
    FalseListeningLocation falseListeningLocation = new FalseListeningLocation();
    await falseListeningLocation.function();
    setState(() {
      print(falseListeningLocation.getCoordinates().toString());
    });
  }

  ListenLocation listenLocation;
  AMapLocation aMapLocation;
}

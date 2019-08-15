
import 'dart:async';

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
      home: new CountdownState(number: 60),
    );
  }
}



class CountdownState extends StatefulWidget {

  // 构造函数
  // constructor
  CountdownState({Key key, this.number}) : super(key: key);

  // 成员变量
  // Member variables
  int number;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CountdownState();
  }
}

class _CountdownState extends State<CountdownState> {

  // 成员变量： 临时存储
  int temp;

  // 成员变量：ICON
  Icon icon;

  // 成员变量：标志Icon
  int key;

  // 成员变量
  Timer _timer;

  // 回调函数
  void _incrementCounter() {

    const oneSec = const Duration(seconds: 1);

    /*var callback = (timer) => {
      setState(() {
        if (this.widget.number < 45) {
          _timer.cancel();
        } else {
          this.widget.number = this.widget.number - 1;
        }
        if (this.key == 0) {
          this.icon = Icon(Icons.access_time);
          this.key = 1;
        } else {
          this.icon = Icon(Icons.access_alarm);
          this.key = 0;
          this.widget.number = 60;
          _timer.cancel();
        }
      })
    };

    _timer = Timer.periodic(oneSec, callback);*/

    setState(() {
      if (this.widget.number > 0) {
        if (mounted) {
          _timer =  new Timer.periodic(oneSec, (timer) {
            setState(() {
              if (this.widget.number > 0) {
                this.widget.number--;
                print(this.widget.number);
              }
            });
          });
        }
        if (this.key == 0) {
          this.icon = Icon(Icons.access_time);
          this.key = 1;
        } else {
          this.icon = Icon(Icons.access_alarm);
          this.key = 0;
          this.widget.number = 60;
          _timer.cancel();
          _timer = null;
        }
      }
    });
  }

  // 启动定时器
  void _countdown(){

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('一个倒计时'),
      ),
      body: new Center(
        child: new Text("${this.widget.number}", style: new TextStyle(fontSize: 150),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: this.icon,
      ),
    );
  }

  @override
  void initState() {
    this.temp = this.widget.number;
    this.icon = Icon(Icons.access_alarm);
    this.key = 0;
  }

  @override
  void dispose() {
    this._timer?.cancel();
    this._timer = null;
    super.dispose();
  }


}

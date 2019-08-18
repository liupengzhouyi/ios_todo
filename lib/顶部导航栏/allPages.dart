import 'package:flutter/material.dart';

import 'page01.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, //主题背景颜色
        highlightColor: Colors.purple, //按下按钮时 高亮颜色
        splashColor: Colors.white30, //水波纹颜色
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DefaultTabController 系统默认Tab的控制器
    return DefaultTabController(
      length: 4, //指定有几个Tab(数量与tab数不对应，热部署不会出错，重新运行出错)
      child: MyTitleWidget(),
    );
  }
}
// 顶部导航栏

class MyTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70, //页面背景颜色
      appBar: AppBar(
        // title 中间
        title: Text(
          'RedKey',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.black26, //未被选中标签颜色
          labelColor: Colors.yellowAccent, //被选中标签颜色
          indicatorColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.label, //默认TabBarIndicatorSize.tab
          indicatorWeight: 1.0, //可以控制indicator 厚度(默认1.0,设置成0.01就看不见了)
          tabs: <Widget>[
            //指定Tab的图标，按顺序 从上到下 对应 从左到右
            Tab(icon: Icon(Icons.access_alarm)),
            Tab(icon: Icon(Icons.bluetooth_audio)),
            Tab(icon: Icon(Icons.camera_enhance)),
            Tab(icon: Icon(Icons.delete_outline)),
          ],
        ),
      ),
      // 对应Tab的页面，
      body: TabBarView(
        children: <Widget>[
          MyTabLayout(Icons.access_alarm),
          MyTabLayout(Icons.bluetooth_audio),
          MyTabLayout(Icons.camera_enhance),
          new MyHomePage1(title: '123',),
        ],
      ),
    );
  }

  void _onpaly() {

  }



}

// 页面中填充指定图标作为演示
class MyTabLayout extends StatelessWidget {
  IconData icon;
  MyTabLayout(IconData myIcon) {
    this.icon = myIcon;
  }
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 200,
      color: Colors.black26,
    );
  }
}


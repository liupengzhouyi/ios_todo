import 'package:flutter/material.dart';
import 'package:ios_todo/globalVariable/bus.dart';
import 'package:ios_todo/globalVariable/page01.dart';
import 'package:ios_todo/globalVariable/page02.dart';
import 'package:ios_todo/globalVariable/page03.dart';
import 'package:ios_todo/globalVariable/page04.dart';

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
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      title: Text("消息"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      title: Text("个人中心"),
    ),
  ];

  int currentIndex;

  final pages = [
    MyHomePage1(title: '111',),
    MyHomePage2(title: '222',),
    MyHomePage3(title: '333',),
    MyHomePage4(title: '444',)
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    /*UserLoggedInEvent userLoggedInEvent = new UserLoggedInEvent('开始');
    userLoggedInEvent.setNumber(100);
    eventBus.fire(userLoggedInEvent);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 标题
      appBar: AppBar(title: Text("底部导航栏"),),
      // 页面
      body: pages[currentIndex],
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}


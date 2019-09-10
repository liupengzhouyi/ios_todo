import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ListView Demo',
      home: new ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ListView Dmoe'),
        leading: new Icon(Icons.menu,size: 40,color: Colors.white,),
        /*actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: (){
            Fluttertoast.showToast(msg: '点击了搜索按钮',toastLength: Toast.LENGTH_LONG,textColor: Colors.white,gravity: ToastGravity.BOTTOM);
          })
        ],*/
      ),
      body: new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 10,horizontal: 10),//给子元素设置水平和垂直方向的padding
        padding: new EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),//给子元素设置左、上、右、下的padding
        children: <Widget>[
          //数据源
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第一条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第二条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第三条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第四条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第五条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第六条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第七条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第八条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第九条数据'),),
          ListTile(leading: new Icon(Icons.add_circle_outline),title: new Text('第十条数据'),),
          //new ViewItem();
        ],
      ),
    );
  }
}
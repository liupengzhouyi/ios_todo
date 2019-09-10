import 'package:flutter/material.dart';
import 'package:ios_todo/showView/Data.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Card",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Card"),
        ),
        body: new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://www.baidu.com",
            imageURL: "https://avatars3.githubusercontent.com/u/19513504?s=460&v=4",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
        ),
      ),
    );
  }
}

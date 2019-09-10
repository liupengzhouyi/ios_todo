import 'package:flutter/material.dart';
import 'package:show_web/Data.dart';

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
      body: new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 10,horizontal: 10),//给子元素设置水平和垂直方向的padding
        padding: new EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),//给子元素设置左、上、右、下的padding
        children: <Widget>[
          //数据源
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          new ItmeModel(
            title: "深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神深入学习贯彻党的十九大精神",
            url: "https://blog.csdn.net/duo_shine/article/details/81261383",
            imageURL: "https://i.loli.net/2019/09/09/UHJKTDmbkhP5yuF.png",
            reportTitle: "党的十九大吹响了新时代推进中国特色社会主义伟大事业的嘹亮号角。在学懂、弄通、做实上下功夫，从城市到农村，从内陆到边陲，神州各地迅速掀起学习贯彻落实党的十九大精神热潮。在习近平新时代中国特色社会主义思想指引下，全国各族人民正在全面建设社会主义现代化强国的征程上奋勇向前。",
          ),
          //new ViewItem();
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_web/webMain.dart';

/**
 * function: 显示一个图片和标题， 点击跳转到详情页
 * author:liupeng
 * contcct: liupeng.0@outlook.com
 * date-time:2019年9月9日 15点58分
 */
class ItmeModel extends StatelessWidget {

  // 标题
  String title;
  // 文章url : 用来跳转到详情页
  String url;
  // 图片URL
  String imageURL;
  // 副标题
  String reportTitle;
  // 构造函数
  ItmeModel({this.title, this.url, this.imageURL, this.reportTitle});

  @override
  Widget build(BuildContext context) {
    //sizedBox部件会强制子项具有给定的宽度和高度(父级允许的话),如果没有给定宽度|高度,将
    //自行调整以维护子项大小
    return new SizedBox(
      height: 350.0,
      child: buildCard(context),
    );
  }

  Widget buildCard(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //跳转到新的 页面我们需要调用 navigator.push方法
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new WebMain(url: this.url,)));
      },
      child: new Card(
        //背景色
        color: Colors.white70,
        //阴影大小-默认2.0
        elevation: 5.00,
        child: new Column(
          //横轴起始测对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图片元素 220
            _buildNewStackImgBack(),
            // 标题元素 60
            _buildNewText(title),
            // 副标题元素 40
            _buildReportTitle(reportTitle),
          ],
        ),
      ),
    );
  }

  /**
   * 1.图片部分
   */
  Widget _buildNewStackImgBack() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大
        maxHeight: 220.0,
      ),
      child: Container(
          height: 220.0,
          width: double.infinity,
          child: new Stack(
            // 对齐方式
            alignment: AlignmentDirectional.center,
            children: [new Image.network(this.imageURL),],
          ),
      ),
    );
  }

  /**
   * 2.标题部分
   */
  Widget _buildNewText(String text) {
    if (text.length > 30) {
      text = text.substring(0, 30) + "...";
    }
    return new Expanded(
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0, top: 5.0),
        height: 60.0,
        child: new Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        // padding: const EdgeInsets.all(5.0),
        /*child: new Column(
          //横轴对齐方式 起始测对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),*/
      ),
    );
  }

  /**
   * 3.副标题部分
   */
  Widget _buildReportTitle(String text) {
    if (text.length > 50) {
      text = text.substring(0, 50) + "...";
    }
    return new Expanded(
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0, top: 5.0),
        padding: const EdgeInsets.all(5.0),
        height: 40,
        child: new Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        /*child: new Column(
          //横轴对齐方式 起始测对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),*/
      ),
    );
  }
}
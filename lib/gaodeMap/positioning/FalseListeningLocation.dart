
// 功能: 直接获取定位信息
// function: get location information
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-14 14:47
// date-time: 2019-08-14 14:47
import 'dart:async';

import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';
import 'package:ios_todo/gaodeMap/positioning/GetLocation.dart';

// 没有集成 -- 无法使用
// 功能: 假的获取定位信息
// function: false listening location information
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-16 12:10
// date-time: 2019-08-16 12:10
class FalseListeningLocation {

  // 成员变量：直接获取位置信息
  // Member variables: get location information directly
  GetLocation getLocation;

  // 成员变量：存储获取的位置信息
  // Member variable: stores the obtained location information
  AMapLocation aMapLocation;

  // 成员变量：存储定位信息
  // Member variable: Store location information
  String positioningResults;

  // 成员变量：存储坐标
  // Member variable: stores coordinates
  Coordinates coordinates;

  // 没有参数的构造函数
  // A constructor with no arguments
  FalseListeningLocation();

  // 成员变量：一个计时器
  // Member variable: A timer
  Timer countdownTimer;

  // 主要功能函数：每隔5秒获取定位信息
  // main function: direct access to location information
  void function() async {
    this.getLocation = new GetLocation();
    countdownTimer = await new Timer.periodic(new Duration(seconds: 5), (timer) {
      this.updateLocation();
    });
  }

  void updateLocation() async {
    await this.getLocation.function();
    this.aMapLocation = this.getLocation.getAMapLocation();
    this.positioningResults = this.getLocation.getPositioningResults();
    this.coordinates = this.getLocation.getCoordinates();
   /* print('---');
    print(this.coordinates.toString());
    print('---');*/
  }

  // 获取直接定位
  //
  GetLocation getGetLocation() {
    return this.getLocation;
  }

  // 停止计时，停止持续定位
  // Stop timing, stop continuous positioning
  void dispaluy() {
    this.countdownTimer?.cancel();
    this.countdownTimer = null;
  }

  // 获取定位结果
  // get positioning Results
  String getPositioningResults() {
    return this.positioningResults;
  }

  // 获取坐标类
  // get Coordinates
  Coordinates getCoordinates() {
    return this.coordinates;
  }

  // 获取定位信息
  // get Location Information
  AMapLocation getAMapLocation() {
    return this.aMapLocation;
  }
}
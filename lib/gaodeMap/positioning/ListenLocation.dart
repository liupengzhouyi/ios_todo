
import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';


// 功能: 监听获取定位信息
// function: get location information
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-14 15:07
// date-time: 2019-08-14 15:07
class ListenLocation {

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
  ListenLocation();

  // 主要功能函数：监听获取定位信息
  // Main function: listen for location information
  void funcation() async {

    AMapLocationClient.startLocation();

    AMapLocationClient.startLocation();

    await AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      this.aMapLocation = loc;
    });
    // 开始监听定位
    AMapLocationClient.startLocation();
    // 获取坐标类
    // Coordinates coordinates = new Coordinates(this.aMapLocation.longitude, this.aMapLocation.latitude);
    // print(coordinates.toString());
    // 坐标持久化
    this.coordinates = coordinates;
  }

  // 停止监听位置
  // stop Listen Location
  stopListenLocation() {
    AMapLocationClient.stopLocation();
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
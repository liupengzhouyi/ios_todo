import 'dart:core';
import 'dart:math';

import 'package:ios_todo/gaodeMap/calculationDistance/CalculationDistance.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';

// 实现计算距离的接口
// Implement the interface to calculate the distance
// 参数：Coordinates， Coordinates
// parameter： Coordinates， Coordinates
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-14 16-29
// date-time: 2019-08-14 16-29
class CalculationDistanceByCoordinates implements CalculationDistance {

  // 成员变量：坐标I
  // Member variables: coordinatesI
  Coordinates coordinatesI;

  // 成员变量：坐标II
  // Member variables: coordinatesII
  Coordinates coordinatesII;

  // 构造函数
  // The constructor
  CalculationDistanceByCoordinates(this.coordinatesI, this.coordinatesII);

  // 返回俩个坐标点之间的距离
  // Returns the distance between two coordinate points
  @override
  String calculationDistance() {
    return this.calculateLineDistance(coordinatesI, coordinatesII).toString();
  }

  // 通过高德地图的定位坐标计算俩个坐标的距离
  // Calculate the distance between the two coordinates by using the location coordinates of gaode map
  double calculateLineDistance(Coordinates start, Coordinates end)
  {
    if ((start == null) || (end == null))
    {
      //throw new IllegalArgumentException("非法坐标值，不能为null");
    }
    double d1 = 0.01745329251994329;
    double d2 = start.longitude;
    double d3 = start.latitude;
    double d4 = end.longitude;
    double d5 = end.latitude;
    d2 *= d1;
    d3 *= d1;
    d4 *= d1;
    d5 *= d1;
    double d6 = sin(d2);
    double d7 = sin(d3);
    double d8 = cos(d2);
    double d9 = cos(d3);
    double d10 = sin(d4);
    double d11 = sin(d5);
    double d12 = cos(d4);
    double d13 = cos(d5);
    double arrayOfDouble10, arrayOfDouble11, arrayOfDouble12;
    arrayOfDouble10 = (d9 * d8);
    arrayOfDouble11 = (d9 * d6);
    arrayOfDouble12 = d7;
    double arrayOfDouble20, arrayOfDouble21, arrayOfDouble22;
    arrayOfDouble20 = (d13 * d12);
    arrayOfDouble21 = (d13 * d10);
    arrayOfDouble22 = d11;
    double d14 = sqrt((arrayOfDouble10 - arrayOfDouble20) * (arrayOfDouble10 - arrayOfDouble20)
        + (arrayOfDouble11 - arrayOfDouble21) * (arrayOfDouble11 - arrayOfDouble21)
        + (arrayOfDouble12 - arrayOfDouble22) * (arrayOfDouble12 - arrayOfDouble22));
    return (asin(d14 / 2.0) * 12742001.579854401);
  }

  void setCoordinatesI(Coordinates coordinates) {
    this.coordinatesI = coordinates;
  }

  void setCoordinatesII(Coordinates coordinates) {
    this.coordinatesII = coordinates;
  }

}

/*
void main() {
  Coordinates start = new Coordinates(116.368904, 39.923423);
  Coordinates end = new Coordinates(116.387271, 39.922501);
  print(new CalculationDistanceByCoordinates().calculateLineDistance(start, end));
}*/

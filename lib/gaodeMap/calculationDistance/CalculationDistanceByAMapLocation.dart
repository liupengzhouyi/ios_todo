
import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/calculationDistance/CalculationDistance.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';


// 实现计算距离的接口
// Implement the interface to calculate the distance
// 参数：AMapLocation， AMapLocation
// parameter： AMapLocation， AMapLocation
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-14 16-29
// date-time: 2019-08-14 16-29
class CalculationDistanceByAMapLocation implements CalculationDistance {

  // 成员变量：定位信息I
  // Member variables: Location informationI
  AMapLocation aMapLocationI;

  // 成员变量：定位信息II
  // Member variables: Location informationII
  AMapLocation aMapLocationII;

  // 构造函数
  // The constructor
  CalculationDistanceByAMapLocation(this.aMapLocationI, this.aMapLocationII);

  // 返回俩个坐标点之间的距离
  // Returns the distance between two coordinate points
  @override
  String calculationDistance() {
    Coordinates coordinatesI = this.getCoordinatesByAMapLocation(this.aMapLocationI);
    Coordinates coordinatesII = this.getCoordinatesByAMapLocation(this.aMapLocationII);

  }

  // 通过定位信息获取坐标
  // get coordinates by positioning information
  Coordinates getCoordinatesByAMapLocation(AMapLocation aMapLocation) {
    Coordinates coordinates = new Coordinates(aMapLocation.longitude, aMapLocation.latitude);
    return coordinates;
  }

  // 设置第一个定位信息
  // Set the first location information
  void setAMapLocationI(AMapLocation aMapLocation) {
    this.aMapLocationI = aMapLocation;
  }

  // 获取第一个定位信息
  // Get the Second location information
  AMapLocation getAMapLocationI() {
    return this.aMapLocationI;
  }

  // 设置第二个定位信息
  // Set the Second location information
  void setAMapLocationII(AMapLocation aMapLocation) {
    this.aMapLocationII = aMapLocation;
  }

  // 获取第二个定位信息
  // Get the Second location information
  AMapLocation getAMapLocationII() {
    return this.aMapLocationII;
  }
}
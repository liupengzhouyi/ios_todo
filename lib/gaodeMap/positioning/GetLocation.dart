import 'package:amap_location/amap_location.dart';
import 'package:ios_todo/gaodeMap/model/Coordinates.dart';


// 功能: 直接获取定位信息
// function: get location information
// 作者：刘鹏
// author: liupeng
// 日期-时间：2019-08-14 14:47
// date-time: 2019-08-14 14:47
class GetLocation {

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
  GetLocation();

  // 主要功能函数：直接获取定位信息
  // main function: direct access to location information
  void function() async {
    // print("开始定位。。。");
    AMapLocation loc;
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    loc = await AMapLocationClient.getLocation(true);

    this.aMapLocation = loc;
    if (loc == null) {
      this.positioningResults = "正在定位";
    }
    if (loc.isSuccess()) {
      if (loc.hasAddress()) {
        this.positioningResults = "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc
            .longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc
            .province}";
        // print(this.positioningResults);
      } else {
        this.positioningResults =
        "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
      }
      // 获取坐标类
      Coordinates coordinates = new Coordinates(this.aMapLocation.longitude, this.aMapLocation.latitude);
      // 坐标持久化
      this.coordinates = coordinates;
    } else {
      this.positioningResults = "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
    }
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
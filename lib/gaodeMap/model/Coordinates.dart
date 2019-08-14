
//  类名：坐标
//  class name: Coordinates
//  功能：一个存储坐标的数据结构
//  function: A data structure that stores coordinates
//  作者： 刘鹏
//  author: liuppeng
//  日期-时间：2019-08-14 14：51
//  date-time: 2019-08-14 14：51
class Coordinates {

  //  成员变量：经度
  //  Member variable: longitude
  double longitude;

  //  成员变量：纬度
  //  Member variable: latitude
  double latitude;

  //  构造函数
  //  A constructor
  Coordinates(this.longitude, this.latitude);

  @override
  String toString() {
    return 'Coordinates{longitude: $longitude, latitude: $latitude}';
  }


}
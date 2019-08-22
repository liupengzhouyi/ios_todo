import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import 'Data.dart';

void main() {
  print('main');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DropDownMenu(),
//      home: TestPage(),
    );
  }
}

/**
 * 一个选项
 * 表述这个选项是被选中
 */
class SortCondition {
  // 选项名称
  String name;
  // 是否被选中
  bool isSelected;
  // 构造函数
  SortCondition({this.name, this.isSelected});
}

/**
 * 功能：生成一个下拉框
 * 作者：刘鹏
 * 联系方式：liupeng.0@outlook.com
 * 日期：2019-08-22
 * function: generate a drop-down box
 * author: liu peng
 * contact: liupeng.0@outlook.com
 * date: 2019-08-22
 */
class DropDownMenu extends StatefulWidget {
  @override
  State createState() {
    return new _DropDownMenuState();
  }
}

/**
 * 功能：生成一个下拉框核心类
 * 作者：刘鹏
 * 联系方式：liupeng.0@outlook.com
 * 日期：2019-08-22
 * function: generate a dropdown core class
 * author: liu peng
 * contact: liupeng.0@outlook.com
 * date: 2019-08-22
 */
class _DropDownMenuState extends State<DropDownMenu> {
  /**
   * 成员变量：
   */
  List<String> _dropDownHeaderItemStrings = ['城市', '专业', '学历', '薪资', '测试'];
  /**
   * 成员变量：头部
   */
  List<GZXDropDownHeaderItem> dropDownHeaderList;
  /**
   * 成员变量：用来保存每一个选项下面的被选项的数据
   */
  List<List<SortCondition>> initlist =[];
  /**
   * 成员变量：专业选项
   */
  List<SortCondition> _brandSortConditions = [];
  /**
   * 成员变量：学历选项
   */
  List<SortCondition> _distanceSortConditions = [];
  /**
   * 成员变量：薪水选项
   */
  List<SortCondition> _salaryDataSortConditions = [];
  /**
   * 成员变量：当前专业选项
   */
  SortCondition _selectBrandSortCondition;
  /**
   * 成员变量：当前学历选项
   */
  SortCondition _selectDistanceSortCondition;
  /**
   * 成员变量：当前薪水选项
   */
  SortCondition _selectSalarySortCondition;

  /**
   * 成员变量：控制menu的显示或隐藏
   */
  GZXDropdownMenuController _dropdownMenuController = GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化数据
    this.createSelectedData();
    // 创建选项的标题
    this.setDropDownHeaders();
  }

  /**
   * 功能：初始化的时候使用，创建数据源，初始化数据源
   * 具体做法：给每一个下拉框内添加数据
   * 作者：刘鹏
   * 日期：2019-08-22
   * 联系方式：liupeng.@outlook.com
   * Function: use when initializing, create data source, initialize data source
   * how to do it: add data to each drop-down box
   * author: liu peng
   * date: 2019-08-22
   * contact: liupeng.@outlook.com
   */
  void createSelectedData() {
    // 专业数据
    ProfessionalData professionalData = new ProfessionalData();
    professionalData.init();
    // 学历数据
    RecordOfFormalSchoolingData recordOfFormalSchoolingData = new RecordOfFormalSchoolingData();
    recordOfFormalSchoolingData.init();
    // 薪水数据
    SalaryData salaryData = new SalaryData();
    salaryData.init();

    // 设置专业数据
    List ProfessionalDataList = professionalData.getList();
    for(String professionaldata in ProfessionalDataList) {
      _brandSortConditions.add(SortCondition(name: '${professionaldata}', isSelected: false));
    }
    // 设置学历数据
    List recordOfFormalSchoolingDataList = recordOfFormalSchoolingData.getList();
    for (String data in recordOfFormalSchoolingDataList) {
      _distanceSortConditions.add(SortCondition(name: '${data}', isSelected: false));
    }
    // 设置薪水数据
    List<String> salaryDatalist = salaryData.getList();
    for(String salaryData in salaryDatalist) {
      _salaryDataSortConditions.add(new SortCondition(name: "${salaryData}", isSelected: false));
    }

    // 添加第一个数据：专业数据
    this.initlist.add(_brandSortConditions);
    // 设置当前专业
    _selectBrandSortCondition = _brandSortConditions[0];
    // 添加第二个数据：学历数据
    this.initlist.add(_distanceSortConditions);
    // 设置当前学历
    _selectDistanceSortCondition = _distanceSortConditions[0];
    // 添加第一个数据：薪水数据
    this.initlist.add(_salaryDataSortConditions);
    // 设置当前薪水
    _selectSalarySortCondition = _salaryDataSortConditions[0];

    /*_brandSortConditions.add(SortCondition(name: '全部', isSelected: true));
    _brandSortConditions.add(SortCondition(name: '万达影城1', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城2', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城3', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城4', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城5', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城6', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城7', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城8', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城9', isSelected: false));*/
    /*_distanceSortConditions.add(SortCondition(name: '距离近', isSelected: true));
    _distanceSortConditions.add(SortCondition(name: '价格低', isSelected: false));
    _distanceSortConditions.add(SortCondition(name: '价格高', isSelected: false));*/
  }

  /**
   * 功能：初始化的时候使用，创建选项的标题
   * 作者：刘鹏
   * 日期：2019-08-22
   * 联系方式：liupeng.@outlook.com
   * function: used during initialization to create the title of the option
   * author: liu peng
   * date: 2019-08-22
   * contact: liupeng.@outlook.com
   */
  void setDropDownHeaders() {
    this.dropDownHeaderList = new List<GZXDropDownHeaderItem>();
    for(String str in _dropDownHeaderItemStrings) {
      dropDownHeaderList.add(GZXDropDownHeaderItem(str));
    }
  }


  @override
  Widget build(BuildContext context) {
    // print('_GZXDropDownMenuTestPageState.build');
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(0)),
      backgroundColor: Colors.white,
      endDrawer: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: 0),
        color: Colors.white,
        child: ListView(
          children: <Widget>[TextField()],
        ),
      ),
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: dropDownHeaderList,
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {if (index == 5) {_scaffoldKey.currentState.openEndDrawer();}},
              ),
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 500,
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              // 第一个连级多选
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget: _buildAddressWidget((selectValue) {
                    _dropDownHeaderItemStrings[0] = selectValue;
                    _dropdownMenuController.hide();
                    setState(() {
                      print('测试第一个连级多选');
                    });
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  // dropDownWidget: _buildConditionListWidget(_brandSortConditions, (value) {
                  dropDownWidget: _buildConditionListWidget(initlist[0], (value) {
                    _selectBrandSortCondition = value;
                    _dropDownHeaderItemStrings[1] = _selectBrandSortCondition.name == '全部' ? '品牌' : _selectBrandSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {
                      print('${_selectBrandSortCondition.name}');
                    });
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _distanceSortConditions.length,
                  //dropDownWidget: _buildConditionListWidget(_distanceSortConditions, (value) {
                  dropDownWidget: _buildConditionListWidget(initlist[1], (value) {
                    _selectDistanceSortCondition = value;
                    _dropDownHeaderItemStrings[2] = _selectDistanceSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {
                      print('${_selectDistanceSortCondition.name}');
                    });
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _distanceSortConditions.length,
                  // dropDownWidget: _buildConditionListWidget(_salaryDataSortConditions, (value) {
                  dropDownWidget: _buildConditionListWidget(initlist[2], (value) {
                    _selectDistanceSortCondition = value;
                    _dropDownHeaderItemStrings[2] = _selectDistanceSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {
                      print('${_selectDistanceSortCondition.name}');
                    });
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget: _buildAddressWidget((selectValue) {
                    _dropDownHeaderItemStrings[0] = selectValue;
                    _dropdownMenuController.hide();
                    setState(() {

                    });
                  })),
            ],
          ),
        ],
      ),
    );
  }

  /**
   * 成员变量：第一级选项结果
   */
  int _selectTempFirstLevelIndex = 0;
  /**
   * 成员变量：在第二项中设置的第一级选项结果
   */
  int _selectFirstLevelIndex = 0;
  /**
   * 成员变量：第二级选项结果
   */
  int _selectSecondLevelIndex = -1;

  /**
   * 连级选择框
   */
  _buildAddressWidget(void itemOnTap(String selectValue)) {
    /**
     * 成员变量：第一级选项
     */
    List firstLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '全部';
      }
      return '$index区';
      //return '${cityData.getList()}';
    });

    CityData cityData = new CityData();
    cityData.init();
    firstLevels = cityData.getList();

    /**
     * 成员变量：第二级选项
     */
    List secondLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '全部';
      }
      return '$_selectTempFirstLevelIndex$index街道办';
    });

    for(String str in secondLevels) {
      print('123:' + str);
    }

    AreasData areasData = new AreasData();
    areasData.init();
    secondLevels = areasData.getList();

    return Row(
      children: <Widget>[
        Container(
          width: 120,
          child: ListView(
            children: firstLevels.map((item) {
              int index = firstLevels.indexOf(item);
              return GestureDetector(
                // 回调函数
                onTap: () {
                  _selectTempFirstLevelIndex = index;
                  if (_selectTempFirstLevelIndex == 0) {
                    itemOnTap('全城');
                    return;
                  }
                  setState(() {
                    print('选择第${_selectTempFirstLevelIndex}项');
                  });
                },
                // 元素
                child: Container(
                    height: 40,
                    // 设置背景颜色
                    color: _selectTempFirstLevelIndex == index
                        ? Colors.yellow
                        : Colors.white,
                    // 字体要居中
                    alignment: Alignment.center,
                    // 设置字体颜色
                    child: _selectTempFirstLevelIndex == index
                        ? Text('$item', style: TextStyle(color: Theme.of(context).primaryColor,),)
                        : Text('$item')),
              );
            }).toList(),
          ),
        ),
        // Row会被Expanded撑开，充满主轴可用空间。
        Expanded(
          child: Container(
            // 因为使用了 Expanded ，所以不需要使用【width: 120,】
            // 设置Container颜色
            color: Colors.grey[200],
            // 设置内容：
            // 1. 如果第一项没有选择， 那句没有必要出现第二项的选择项
            // 2. 如果选择第二项，就开始生产第二项的选项
            child: _selectTempFirstLevelIndex == 0 ? Container() : ListView(
              children: secondLevels.map((item) {
                int index = secondLevels.indexOf(item);
                return GestureDetector(
                  // 回调函数
                    onTap: () {
                      _selectSecondLevelIndex = index;
                      _selectFirstLevelIndex = _selectTempFirstLevelIndex;
                      if (_selectSecondLevelIndex == 0) {
                        itemOnTap(firstLevels[_selectFirstLevelIndex]);
                      } else {itemOnTap(item);}
                      setState(() {print('在第二个选择中选择了${_selectSecondLevelIndex}项');});
                    },
                    // 元素
                    child: Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          //能强制子控件具有特定宽度、高度或两者都有,使子控件设置的宽高失效
                          SizedBox(width: 20,),
                          _selectFirstLevelIndex == _selectTempFirstLevelIndex && _selectSecondLevelIndex == index
                              ? Text('$item', style: TextStyle(color: Theme.of(context).primaryColor,),)
                              : Text('$item'),
                        ],
                      ),
                    )
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  /**
   * 成员函数：下拉布局
   */
  _buildConditionListWidget(items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // item 的个数
      itemCount: items.length,
      // 添加分割线
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0),
      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
            // 全部变成未选中状态
            for (var value in items) {
              value.isSelected = false;
            }
            // 设置某一项被选中
            goodsSortCondition.isSelected = true;
            // 被选中之后调用
            itemOnTap(goodsSortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                // 设置对齐的距离，（左右对齐）
                SizedBox(width: 16,),
                Expanded(
                  // 设置要显示的内容
                  child: Text(
                    // 设置要显示的内容
                    goodsSortCondition.name,
                    // 设置要显示的内容的风格 - 设置文字颜色
                    style: TextStyle(color: goodsSortCondition.isSelected ? Theme.of(context).primaryColor : Colors.black,),
                  ),
                ),
                // 设置选中之后的标志
                goodsSortCondition.isSelected
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor, size: 16,)
                    : SizedBox(),
                // 设置对齐的距离，（左右对齐）
                SizedBox(width: 16,),
              ],
            ),
          ),
        );
      },
    );
  }
}


class ProfessionalData {
  List<String> list;

  // 成员方法
  ProfessionalData();

  // 在类表中添加数据
  void addData(String professiona) {
    list.add(professiona);
  }

  // 构建新的数据列表
  void createNewList() {
    this.list = null;
    list = new List<String>();
  }

  List<String> getList() {
    return this.list;
  }

  // 初始化
  void init() {
    this.list = new List<String>();
    list.add('全部');
    list.add('电子信息技术');
    list.add('计算机科学技术');
    list.add('软件工程');
    list.add('大数据');
  }
}


class RecordOfFormalSchoolingData {
  List<String> list;

  // 成员方法
  RecordOfFormalSchoolingData();

  // 在类表中添加数据
  void addData(String recordOfFormalSchooling) {
    list.add(recordOfFormalSchooling);
  }

  // 构建新的数据列表
  void createNewList() {
    this.list = null;
    list = new List<String>();
  }

  List<String> getList() {
    return this.list;
  }

  // 初始化
  void init() {
    this.list = new List<String>();
    list.add('全部');
    list.add('小学');
    list.add('初中');
    list.add('高中');
    list.add('大学');
    list.add('硕士');
    list.add('博士');
  }
}

class SalaryData {
  List<String> list;

  // 成员方法
  SalaryData();

  // 在类表中添加数据
  void addData(String salaryData) {
    list.add(salaryData);
  }

  // 构建新的数据列表
  void createNewList() {
    this.list = null;
    list = new List<String>();
  }

  List<String> getList() {
    return this.list;
  }

  // 初始化
  void init() {
    this.list = new List<String>();
    list.add('全部');
    list.add('2000-3000');
    list.add('3000-4000');
    list.add('5000-6000');
    list.add('7000-8000');
    list.add('8000-10000');
    list.add('10000以上');
  }
}

class CityData {
  List<String> list;

  // 成员方法
  CityData();

  // 在类表中添加数据
  void addData(String cityData) {
    list.add(cityData);
  }

  // 构建新的数据列表
  void createNewList() {
    this.list = null;
    list = new List<String>();
  }

  List<String> getList() {
    return this.list;
  }

  // 初始化
  void init() {
    this.list = new List<String>();
    list.add('全部');
    list.add('呼和浩特市');
    list.add('包头市');
    list.add('乌海市');
    list.add('赤峰市');
    list.add('通辽市');
    list.add('鄂尔多斯市');
    list.add('巴彦淖尔市');
  }
}

class AreasData {
  List<String> list;

  // 成员方法
  AreasData();

  // 在类表中添加数据
  void addData(String areasData) {
    list.add(areasData);
  }

  // 构建新的数据列表
  void createNewList() {
    this.list = null;
    list = new List<String>();
  }

  List<String> getList() {
    return this.list;
  }

  // 初始化
  void init() {
    this.list = new List<String>();
    list.add('全部');
    list.add('东河区');
    list.add('昆都仑区');
    list.add('青山区');
    list.add('石拐区');
    list.add('白云矿区');
    list.add('九原区');
    list.add('土默特右旗');
  }
}
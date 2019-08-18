//Bus初始化
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

int counter = 0;

class UserLoggedInEvent {
  String text;
  int number = -1;

  UserLoggedInEvent(int num){
    this.setNumber(num);
  }

  int getNumber() {
    return this.number;
  }

  void setNumber(int num) {
    this.number = num;
  }
}

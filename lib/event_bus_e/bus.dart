//Bus初始化
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class UserLoggedInEvent {
  String text;
  UserLoggedInEvent(String text){
    this.text = text;
  }
}

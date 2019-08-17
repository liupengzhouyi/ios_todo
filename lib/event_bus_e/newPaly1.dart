import 'package:flutter/material.dart';
import 'bus.dart';

class Second_Page extends StatefulWidget {
  @override
  _Second_PageState createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {

  var result;

  //监听Bus events
  void _listen(){
    eventBus.on<UserLoggedInEvent>().listen((event){
      setState(() {
        result = event.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    return Container(
      child: Text('${result}'),
    );
  }


}
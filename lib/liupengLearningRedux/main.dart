
import 'package:flutter/material.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';
import 'package:ios_todo/liupengLearningRedux/StaticVariable.dart';
import 'package:ios_todo/liupengLearningRedux/frist_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main(){
  // AMapLocationClient.setApiKey("5fa948fc7dccd87dd1b0237bad511490");
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
      home: new ReduxDemo3(store),
    );
  }
}

class ReduxDemo3 extends StatelessWidget {

  final Store<LiupengReduxState> store;
  ReduxDemo3(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<LiupengReduxState>(builder: (BuildContext context, Store<LiupengReduxState> store){
          return MaterialApp(
            title: 'ReduxDemo3',
            theme: new ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FirstPage(),
          );
        })
    );
  }
}


import 'package:flutter/material.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengAction.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class NextPage extends StatefulWidget {

  @override
  State createState() => NextPageState();
}

class NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    /// StoreBuilder
    return StoreBuilder<LiupengReduxState>(
        builder: (BuildContext context, Store<LiupengReduxState> store){

          return Scaffold(
            appBar: AppBar(
              title: Text("这是第二页"),
            ),
            body: Center(
                child: Column(
                  children: <Widget>[
                    Text(store.state.name),
                    SizedBox(height: 100,),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(LiupengAction.Add);
                        },
                        child: Text("点击变换数据")
                    )
                  ],
                )
            ),
          );

        }
    );
  }
}
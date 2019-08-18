import 'package:flutter/material.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';
import 'package:ios_todo/liupengLearningRedux/next_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FirstPage extends StatefulWidget {

  static final String sName = "/";

  @override
  State createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    return StoreBuilder<LiupengReduxState>(
        builder: (BuildContext context, Store<LiupengReduxState> store){
          return Scaffold(
            appBar: AppBar(
              title: Text("ReduxDemo3"),
            ),
            body: Center(
                child: Column(
                  children: <Widget>[
                    Text(store.state.name),
                    SizedBox(height: 100,),
                    FlatButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return NextPage();
                          }));
                        },
                        child: Text("下一页")
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}
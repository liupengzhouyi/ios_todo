// 定义一个 reducer

import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';

import 'LiupengAction.dart';

LiupengReduxState getLiupengRedux(LiupengReduxState liupengReduxState, action) {
  if (action == LiupengAction.Add) {
    String str = "1";
    liupengReduxState.name = liupengReduxState.name + str;
  }
  return liupengReduxState;
}
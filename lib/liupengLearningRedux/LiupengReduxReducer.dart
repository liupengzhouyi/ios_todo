

import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';
import 'LiupengAction.dart';

// 定义一个 reducer
LiupengReduxState getLiupengRedux(LiupengReduxState liupengReduxState, action) {
  if (action == LiupengAction.Add) {
    String str = "1";
    liupengReduxState.name = liupengReduxState.name + str;
  }
  return liupengReduxState;
}
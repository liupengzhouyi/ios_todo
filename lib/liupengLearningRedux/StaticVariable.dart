
import 'package:redux/redux.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengReduxState.dart';
import 'package:ios_todo/liupengLearningRedux/LiupengReduxReducer.dart';

final store = Store<LiupengReduxState>(
  getLiupengRedux,
  initialState: LiupengReduxState.initState()
);
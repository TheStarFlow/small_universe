//     @Description
//     @Author zhongzusheng
//     @date 2024_03_26

import 'package:small_universe/ability/navigator/route_navigator.dart';

class MyNavigator extends RouteJump {
  static MyNavigator? _instance;

  MyNavigator._();

  static MyNavigator getInstance() {
    _instance ??= MyNavigator._();
    return _instance!;
  }

  RouteJumpListener? _routeJump;

  @override
  void onJumpTo(RouteStatus status, {Map? args}) {
    _routeJump?.onJumpTo(status, args: args);
  }

  void registerJump(RouteJumpListener jump) {
    _routeJump = jump;
  }
}

typedef OnJumpTo = void Function(RouteStatus routeStatus, {Map? args});

class RouteJumpListener {
  final OnJumpTo onJumpTo;

  RouteJumpListener({required this.onJumpTo});
}

abstract class RouteJump {
  void onJumpTo(RouteStatus status, {Map? args});
}

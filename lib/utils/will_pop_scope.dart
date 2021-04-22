import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast_util.dart';

///-----------监听返回按键----------------///
class WillPopScopeTestRoute extends StatefulWidget {
  final Widget child;

  const WillPopScopeTestRoute({Key key, @required this.child})
      : super(key: key);

  @override
  _WillPopScopeTestRouteState createState() {
    return new _WillPopScopeTestRouteState();
  }
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedTime; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedTime = DateTime.now();
            Toast.show(context, "再按一次退出");
            return false;
          }
          return true;
        },
        child: widget.child);
  }
}

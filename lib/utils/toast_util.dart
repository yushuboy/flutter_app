import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
/// toast工具
///
class Toast {
  Toast._();

  static show(BuildContext context, String msg) {
    ScaffoldMessengerState state = ScaffoldMessenger.of(context);
    state.removeCurrentSnackBar();
    state.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(msg),
      ),
    );
  }

  static showCenter(BuildContext context, String msg) {
    ScaffoldMessengerState state = ScaffoldMessenger.of(context);
    state.removeCurrentSnackBar();
    state.showSnackBar(
      SnackBar(
        backgroundColor: Color(0xEB2B2B2B),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(left: 80, top: 0, right: 80, bottom: 150),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(msg, textAlign: TextAlign.center),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}

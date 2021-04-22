import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

/// name : "flutter"
/// age : 2
/// email : "flutter@example.com"

class UserMode {
  String _name;
  int _age;
  String _email;

  String get name => _name;

  int get age => _age;

  String get email => _email;

  UserMode({String name, int age, String email}) {
    _name = name;
    _age = age;
    _email = email;
  }

  UserMode.fromJson(dynamic json) {
    _name = json["name"];
    _age = json["age"];
    _email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["age"] = _age;
    map["email"] = _email;
    return map;
  }

  @override
  String toString() {
    return 'UserMode{_name: $_name, _age: $_age, _email: $_email}';
  }
}

class TestJson2 {
  void test1() {
    String jsonStr =
        "{\"name\":\"laomeng\",\"age\":12,\"email\":\"flutter@example.com\"}";
    var map = json.decode(jsonStr);

    UserMode userMode = UserMode.fromJson(map);
    print(userMode);

    var map2 = userMode.toJson();
    print(map2);
  }

  void test2(BuildContext context) {
    // 1.媒体查询信息
    final mediaQueryData = MediaQuery.of(context);
    // 2.获取宽度和高度
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    final dpr = window.devicePixelRatio;
    print("屏幕width:$screenWidth height:$screenHeight");
    print("分辨率: $physicalWidth - $physicalHeight");
    print("dpr: $dpr");

    // 3.状态栏的高度
    // 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
    // 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    print("状态栏height: $statusBarHeight 底部高度:$bottomHeight");
  }
}

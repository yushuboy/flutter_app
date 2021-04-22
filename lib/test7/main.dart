import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test4/sliver.dart';
import 'package:flutter_app/test7/http_dio.dart';
import 'package:flutter_app/test7/json_model.dart';
import 'package:flutter_app/test7/user_mode.dart';
import 'file:///E:/project/flutter_app/flutter_app/lib/utils/share_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Button")),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("读取"),
                  onPressed: () {
                    _test();
                  }),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("异步"),
                  onPressed: () {
                    _async();
                  }),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("网络"),
                  onPressed: () {
                   DioHttp().get();
                  }),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("Json"),
                  onPressed: () {
                    TestJson2().test2(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _testGet() {
    _get()
        .then((value) =>
    {
      print('Response status: ${value.statusCode}'),
      print('Response body: ${value.body}'),
    })
        .whenComplete(() => print('异步任务处理完成'))
    // ignore: return_of_invalid_type_from_catch_error
        .catchError((error) => print('"出现异常: $error'));
  }

  Future<http.Response> _get() async {
    http.Response response = await http.get(Uri.parse(
        'https://github.com/781238222/flutter-do/blob/master/README.md'));
    return response;
  }

  void _async() {
    Future.delayed(const Duration(seconds: 3), () => print('task'))
        .then((_) => print('callback1'))
        .then((_) => throw 'we have a problem')
        .catchError((error) => print('catch: $error'))
        .whenComplete(() => print('whenComplete'));
  }

  Future<void> _test() async {
    // 创建两个实例对象
    var ps = PersistentStorage();
    var ps2 = PersistentStorage();
    // 单例模式 对象是同一个对象
    print("两个对象是否相等:${ps == ps2}"); // true
    // 1. 存储所有类型的值
    ps.setStorage('Map', {"key": "value"}); // 存储Map
    ps.setStorage('int', 1); // 存储int
    ps.setStorage('double', 1.0); // 存储double
    ps.setStorage('bool', true); // 存储bool
    ps.setStorage('String', "Hello World"); // 存储String
    ps.setStorage('List', [1, true, 'String', 1.0]); // 存储List

    // 除setStorage以外 获取的方法的返回值全部都是Future类型
    // 因此需要使用await获取 或者 在其.then方法中获取值

    // 2. 根据key获取存储的值
    // 2.1 通过await 直接获取存储的值 注意 await只能在async方法中使用
    print(await ps.getStorage('Map')); // {key: value}
    // 2.2 在then中获取存储的值
    ps.getStorage('Map').then((value) => print(value)); // {key: value}

    // 同上

    // 3. 根据key移除存储的值
    print(await ps.removeStorage("List")); // true  删除成功
    print(await ps.removeStorage('nothing')); // false 删除失败

    // 4. 是否包含某个key
    print(await ps.hasKey('map')); // 存在   true
    print(await ps.hasKey("List")); // 不存在 false

    // 5. 获取所有的key
    print(await ps.getKeys());

    // 6. 清空所有存储
    print(await ps.clear()); //一直都会返回true
  }
}

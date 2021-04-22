import 'package:flutter/material.dart';
import 'package:flutter_app/test5/draggable.dart';
import 'package:flutter_app/test5/popup_dialog.dart';

class SecondPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第二页',
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.red),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text("第二页", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          toolbarHeight: 50,
        ),
        body: PopupMenuDemo(),
      ),
    );
  }
}

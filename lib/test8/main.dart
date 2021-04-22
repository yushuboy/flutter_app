import 'package:flutter/material.dart';
import 'package:flutter_app/test8/animation_controller.dart';

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
          child: AnimationBaseDemo(),
        ),
      ),
    );
  }
}

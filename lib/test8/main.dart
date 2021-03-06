import 'package:flutter/material.dart';
import 'package:flutter_app/test8/transition_anim.dart';

import 'custom_view.dart';
import 'hero_animation.dart';

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
          child: Transition(),
        ),
      ),
    );
  }
}

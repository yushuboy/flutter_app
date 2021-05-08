import 'package:flutter/material.dart';
import 'package:flutter_app/test9/provider_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

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
        // body: Center(child: CustomPaint(painter: CirclePlatePainter(), size: Size(200, 200))),
        body: TextField(
          scrollPadding: EdgeInsets.all(0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            icon: Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.red, fontSize: 24),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Example"),
        ),
        body: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <InlineSpan>[
                TextSpan(text: '老孟', style: TextStyle(color: Colors.red)),
                TextSpan(text: '，', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '一个有态度的程序员', style: TextStyle(color: Colors.black)),
              ]),
        ),
      ),
    );
  }
}

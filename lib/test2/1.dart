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
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Button")),
        body: Center(
          child: _createButton(),
        ),
      ),
    );
  }

  Widget _createButton() {
    return Column(
      children: [
        RaisedButton(
          child: Text('RaisedButton'),
          elevation: 1.0,
          shape: ContinuousRectangleBorder(
              side: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            print('onPressed');
          },
          onLongPress: () {
            print('onLongPress');
          },
          onHighlightChanged: (highlight) {
            print('onHighlightChanged:$highlight');
          },
        ),
        ElevatedButton(
          child: Text('ElevatedButton'),
          onPressed: () {
            print("ElevatedButton");
          },
        ),
        TextButton(
          child: Text(
            'FlatButton',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white70)),
          onPressed: () {
            print("TextButton");
          },
        ),
        OutlinedButton(
          child: Text('OutlinedButton'),
          onPressed: () {
            print("OutlinedButton");
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
      ],
    );
  }
}

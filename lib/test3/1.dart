import 'package:flutter/material.dart';
import 'package:flutter_app/test3/gesture_detector.dart';
import 'package:flutter_app/test3/setting_item.dart';

import 'bar_chart.dart';
import 'draw_canvas.dart';
import 'location_position.dart';

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
        body: DrawingBoard(),
      ),
    );
  }

  Widget _createWrap(int what) {
    if (what == 1) {
      return Wrap(
        children: List.generate(16, (i) {
          double w = 50.0 + 10 * i;
          return Container(
            color: Colors.primaries[i],
            height: 50,
            width: w,
            child: Text('$i'),
          );
        }),
      );
    } else if (what == 2) {
      return Wrap(
        spacing: 5,
        direction: Axis.vertical,
        children: List.generate(16, (i) {
          double w = 50.0 + 10 * i;
          return Container(
            color: Colors.primaries[i],
            height: 50,
            width: w,
            child: Text('$i'),
          );
        }),
      );
    }
    return null;
  }

  Widget _createRowColumn(int what) {
    if (what == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.blue,
          ),
        ],
      );
    } else if (what == 2) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.blue,
          ),
        ],
      );
    } else if (what == 3) {
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.green,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      );
    }
    return null;
  }

  Widget _createStack(int what) {
    if (what == 1) {
      return Stack(
        //居中显示，默认是左上角（帧布局）
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 170,
            width: 170,
            color: Colors.blue,
          ),
          Container(
            height: 140,
            width: 140,
            color: Colors.yellow,
          )
        ],
      );
    } else if (what == 3) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 170,
            width: 170,
            color: Colors.blue,
          ),
          Positioned(
            left: 30,
            right: 40,
            bottom: 50,
            top: 60,
            child: Container(
              color: Colors.yellow,
            ),
          )
        ],
      );
    }
    return null;
  }
}

class IndexedStackDemo extends StatefulWidget {
  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        _buildIndexedStack(),
        SizedBox(
          height: 30,
        ),
        _buildRow(),
      ],
    );
  }

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: Icon(
              Icons.cake,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.fastfood),
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.cake),
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.local_cafe),
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
        ),
      ],
    );
  }
}

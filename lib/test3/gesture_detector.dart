import 'package:flutter/material.dart';

class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: ButtonCase());
  }

  Widget _createGesture(int what) {
    if (what == 1) {
      return GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          print('onTapDown');
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          print('onTapUp');
        },
        onTap: () {
          print('onTap');
        },
        onTapCancel: () {
          print('onTapCancel');
        },
        onDoubleTap: () {
          print("onDoubleTap");
        },
        onLongPress: () {
          print("onLongPress");
        },
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      );
    } else if (what == 2) {
      return GestureDetector(
        onVerticalDragStart: (v) => print('onVerticalDragStart'),
        onVerticalDragDown: (v) => print('onVerticalDragDown'),
        onVerticalDragUpdate: (v) => print('onVerticalDragUpdate'),
        onVerticalDragCancel: () => print('onVerticalDragCancel'),
        onVerticalDragEnd: (v) => print('onVerticalDragEnd'),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      );
    } else if (what == 3) {
      return GestureDetector(
        onScaleStart: (v) => print('onScaleStart'),
        onScaleUpdate: (ScaleUpdateDetails v) => print('onScaleUpdate'),
        onScaleEnd: (v) => print('onScaleEnd'),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      );
    }
    //点击水波效果
    return Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            '这是InkWell的点击效果',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}



class ButtonCase extends StatefulWidget {
  @override
  _ButtonCaseState createState() => _ButtonCaseState();
}

class _ButtonCaseState extends State<ButtonCase> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Text(
        '登 录',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: 240,
      height: 48,
      onPressed: () {
        setState(() {
          _buttonStatus = ButtonStatus.loading;
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _buttonStatus = ButtonStatus.done;
            });
          });
        });
      },
      child: _buildChild(),
    );
  }
}

enum ButtonStatus { none, loading, done }

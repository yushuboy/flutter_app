import 'package:flutter/material.dart';

class AnimationBaseDemo extends StatefulWidget {
  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}

class _AnimationBaseDemoState extends State<AnimationBaseDemo> with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _controller;

  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..addListener(() {
        setState(() {
          _size = 100 + 100 * _controller.value;
          _color = Color.lerp(_startColor, _endColor, _controller.value);
          print("value: ${_controller.value}");
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _controller.forward();
        },
        child: Container(
          height: _size,
          width: _size,
          color: _color,
          alignment: Alignment.center,
          child: Text(
            '点我变大',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

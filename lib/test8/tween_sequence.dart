import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationDemo();
}

class _AnimationDemo extends State<AnimationDemo> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;
  Animation _sizeAnimation;

  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 5), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 0.5)));

    _sizeAnimation = Tween(begin: 100.0, end: 300.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.5, 1.0)));

    //按顺序组合动画
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 200.0).chain(CurveTween(curve: Curves.easeIn)), weight: 40),
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40),
    ]).animate(_animationController);

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: _sizeAnimation.value, width: _sizeAnimation.value, color: _colorAnimation.value),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

///封住好的动画组件
class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _opacity = 0;
            });
          },
          child: Container(
            height: 60,
            width: 150,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

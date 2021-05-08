import 'dart:math';

import 'package:flutter/material.dart';

class Transition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return ClipPath(
                    clipper: CirclePath(animation.value),
                    child: child,
                  );
                },
                child: PageB(),
              );
            }));
          },
          child: Text("转场"))
    ]);
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath(this.value);

  final double value;

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = value * sqrt(size.height * size.height + size.width * size.width);
    path.addOval(Rect.fromLTRB(size.width - radius, -radius, size.width + radius, radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CirclePageRoute extends PageRoute {
  CirclePageRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(animation.value),
          child: child,
        );
      },
      child: builder(context),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text("Button")),
        body: Center(
          child: Text("PageB"),
        ),
      ),
    );
  }
}

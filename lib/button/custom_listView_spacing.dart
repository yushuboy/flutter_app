import 'package:flutter/material.dart';

class CustomListViewSpacing extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final Axis scrollDirection;
  const CustomListViewSpacing({required this.children, this.spacing = 0.0, this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: children
          .map((c) => Container(
                padding: EdgeInsets.all(spacing),
                child: c,
              ))
          .toList(),
    );
  }
}

class ButtonTextStyle {
  ///Selected color of Text
  final Color selectedColor;

  ///Unselected color of Text
  final Color unSelectedColor;
  final TextStyle textStyle;

  const ButtonTextStyle({
    this.selectedColor = Colors.white,
    this.unSelectedColor = Colors.black,
    this.textStyle = const TextStyle(),
  });
}

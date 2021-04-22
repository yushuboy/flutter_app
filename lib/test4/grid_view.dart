import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _createGrid(3);
  }

  Widget _createGrid(int what) {
    if (what == 1) {
      return GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.5,
          crossAxisSpacing: 1.5,
        ),
        children: [
          _createGridViewItem(Colors.primaries[0]),
          _createGridViewItem(Colors.primaries[1]),
          _createGridViewItem(Colors.primaries[2]),
          _createGridViewItem(Colors.primaries[3]),
          _createGridViewItem(Colors.primaries[4]),
          _createGridViewItem(Colors.primaries[5]),
          _createGridViewItem(Colors.primaries[6]),
          _createGridViewItem(Colors.primaries[7]),
        ],
      );
    } else if (what == 2) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.5,
          crossAxisSpacing: 1.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        itemCount: 50,
      );
    } else if (what == 3) {
      //ScrollView
      return SingleChildScrollView(
        child: Column(
          children: List.generate(50, (index) {
            return Container(
              height: 150,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }).toList(),
        ),
      );
    }
    return null;
  }

  _createGridViewItem(Color color) {
    return Container(
      color: color,
    );
  }
}

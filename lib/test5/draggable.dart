import 'package:flutter/material.dart';

class DraggableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return _createPopup(2);
    return _createDraggable(1, context);
  }

  Widget _createDraggable(int what, BuildContext context) {
    if (what == 1) {
      return Center(
          child: Draggable(
        // axis: Axis.vertical,
        onDragStarted: () => {print("onDragStarted")},
        onDragUpdate: (details) =>
            {print("onDragUpdate:  ${details.localPosition}")},
        onDraggableCanceled: (velocity, offset) =>
            {print("onDraggableCanceled")},
        onDragEnd: (details) => {print("onDragEnd")},
        onDragCompleted: () => {print("onDragCompleted")},
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(6)),
          child: Text(
            '孟',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        feedback: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(6)),
          child: Text(
            '孟',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ));
    }
    return null;
  }
}

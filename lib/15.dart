/// Flutter code sample for Stepper

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index <= 0) {
            return;
          }
          setState(() {
            _index--;
          });
        },
        onStepContinue: () {
          if (_index >= 1) {
            return;
          }
          setState(() {
            _index++;
          });
        },
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
        steps: [
          Step(
            title: Text("Step 1 title"),
            content: Container(
                alignment: Alignment.centerLeft,
                child: Text("Content for Step 1")),
          ),
          Step(
            title: Text("Step 2 title"),
            content: Text("Content for Step 2"),
          ),
        ],
      ),
    );
  }
}

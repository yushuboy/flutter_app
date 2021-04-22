import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
          child: _createProgress(),
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget _createProgress() {
    if (Platform.isIOS) {
      //ios相关代码
      return CupertinoActivityIndicator(
        radius: 14,
      );
    } else if (Platform.isAndroid) {
      //android相关代码
      return CircularProgressIndicator(
        value: 0.3,
        backgroundColor: Colors.greenAccent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      );
    }
  }
}

class StateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateCheck();
}

class StateRadio extends State<StateWidget> {
  String _radioGroupValue = '语文';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RadioListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            title: Text('语文'),
            value: '语文',
            groupValue: _radioGroupValue,
            onChanged: (value) {
              setState(() {
                _radioGroupValue = value;
              });
            },
          ),
        ),
        Flexible(
            child: RadioListTile(
          title: Text('数学'),
          value: '数学',
          groupValue: _radioGroupValue,
          onChanged: (value) {
            setState(() {
              _radioGroupValue = value;
            });
          },
        )),
        Flexible(
            child: RadioListTile(
          title: Text('英语'),
          value: '英语',
          groupValue: _radioGroupValue,
          onChanged: (value) {
            setState(() {
              _radioGroupValue = value;
            });
          },
        )),
      ],
    );
  }
}

class StateCheck extends State<StateWidget> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        //勾在前面还是后面
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('老孟'),
        value: _checkValue,
        subtitle: Text('一枚有态度的程序员'),
        secondary: Icon(
          Icons.person,
          size: 40,
        ),
        onChanged: (value) {
          setState(() {
            _checkValue = value;
          });
        });
  }
}

class StateSlider extends State<StateWidget> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    //根据平台适配
    return Slider.adaptive(
      value: _sliderValue,
      onChanged: (v) {
        setState(() {
          _sliderValue = v;
        });
      },
    );
  }
}

class SwitchSlider extends State<StateWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('是否允许4G下载'),
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }
}

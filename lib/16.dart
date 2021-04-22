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
          child: APage(),
        ),
      ),
    );
  }
}

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text('A 页面'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BPage();
          }));
        },
      ),
    );
  }
}

class BPage extends StatelessWidget {
  DateTime _lastQuitTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // ignore: missing_return
          _exitTime(context);
        },
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('B 页面'),
              onPressed: () {
                _exitTime(context);
              },
            ),
          ),
        ));
  }

  bool _exitTime(BuildContext context) {
    if (_lastQuitTime == null ||
        DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
      print('再按一次 Back 按钮退出');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('再按一次 Back 按钮退出'),
          duration: const Duration(milliseconds: 1000)));
      _lastQuitTime = DateTime.now();
      return false;
    } else {
      print('退出');
      Navigator.of(context).pop(true);
      return true;
    }
  }
}

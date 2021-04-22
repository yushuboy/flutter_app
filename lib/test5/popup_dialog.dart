import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMenuDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return _createPopup(2);
    return _createDialog(2, context);
  }

  Widget _createPopup(int what) {
    if (what == 1) {
      return PopupMenuButton<String>(
        initialValue: '语文',
        ////菜单弹出位置
        // offset: Offset(0,0),
        tooltip: 'PopupMenuButton',
        onSelected: (value) {
          print('$value');
        },
        onCanceled: () {
          print('onCanceled');
        },
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: '语文',
              child: Text('语文'),
            ),
            PopupMenuDivider(height: 1),
            PopupMenuItem<String>(
              value: '数学',
              child: Text('数学'),
            ),
            PopupMenuDivider(height: 1),
            PopupMenuItem<String>(
              value: '英语',
              child: Text('英语'),
            ),
            PopupMenuDivider(height: 1),
            PopupMenuItem<String>(
              value: '生物',
              child: Text('生物'),
            ),
            PopupMenuDivider(height: 1),
            PopupMenuItem<String>(
              value: '化学',
              child: Text('化学'),
            ),
          ];
        },
      );
    } else if (what == 2) {
      return PopupMenuButton<String>(
        onSelected: (value) {
          print('$value');
        },
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[
            CheckedPopupMenuItem(
              value: '语文',
              checked: true,
              child: Text('语文'),
            ),
            PopupMenuDivider(height: 1),
            CheckedPopupMenuItem(
              value: '数学',
              child: Text('数学'),
            ),
          ];
        },
      );
    }
    return null;
  }

  Widget _createDialog(int what, BuildContext context) {
    if (what == 1) {
      return ElevatedButton(
        child: Text('切换'),
        onPressed: () async {
          var result = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text('确认删除吗？'),
                  //改变外观
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  actions: <Widget>[
                    TextButton(
                      child: Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop('cancel');
                      },
                    ),
                    TextButton(
                      child: Text('确认'),
                      onPressed: () {
                        Navigator.of(context).pop('ok');
                      },
                    ),
                  ],
                );
              });
          print("result: $result");
        },
      );
    } else if (what == 2) {
      //ios样式
      return ElevatedButton(
        child: Text('切换'),
        onPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('提示'),
                  content: Text('确认删除吗？'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('取消'),
                      onPressed: () {},
                    ),
                    CupertinoDialogAction(
                      child: Text('确认'),
                      onPressed: () {},
                    ),
                  ],
                );
              });
        },
      );
    }
    return null;
  }
}

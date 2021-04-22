import 'package:flutter/material.dart';
import 'package:flutter_app/test5/draggable.dart';
import 'package:flutter_app/test5/popup_dialog.dart';
import 'package:flutter_app/test5/second_page.dart';
import 'package:flutter_app/test5/tab_bar.dart';

void main() => runApp(MyApp());

///************
///MaterialApp按照如下的规则匹配路由：
///
/// 路由为/，home不为null则使用home。
/// 使用routes指定的路由。
/// 使用onGenerateRoute生成的路由，处理除home和routes以外的路由。
/// 如果上面都不匹配则调用onUnknownRoute。
///
///
///***********************///
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.red),
      themeMode: ThemeMode.system,
      routes: {
        'secondPage': (context) => SecondPage(),
      },
      initialRoute: '/',
      // ignore: missing_return
      onGenerateRoute: (RouteSettings routeSettings) {
        print('onGenerateRoute:$routeSettings');
        if (routeSettings.name == 'secondPage') {
          return MaterialPageRoute(builder: (context) {
            return SecondPage();
          });
        }
      },
      onUnknownRoute: (RouteSettings routeSettings) {
        print('onUnknownRoute:$routeSettings');
        return MaterialPageRoute(builder: (context) {
          return SecondPage();
        });
      },
      home: MyStatelessWidget(),
    );
  }

  Widget _createScaffold() {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(),
          title: Text("玉树", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          toolbarHeight: 50,
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Text('语文'),
          //     Text('数学'),
          //     Text('英语'),
          //     Text('体育'),
          //     Text('音乐'),
          //   ],
          //   controller: TabController(length: 5, vsync: this),
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ]),
      //左右抽屉
      // drawer: Drawer(),
      // endDrawer: Drawer(),
      //底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '书籍', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: '我的', icon: Icon(Icons.perm_identity)),
        ],
      ),
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.refresh),
      ),
      body: PopupMenuDemo(),
    );
  }
}

class _Tab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends State<_Tab> {
  TabController _controller;

  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '数学',
    '生物',
    '体育',
    '经济',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("44446666");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast_util.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBar();
}

class _TabBar extends State<TabBarDemo> {
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

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        // Your code goes here.
        // To get index of current tab use tabController.index
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          tabs: _tabValues.map((f) {
            return Text(f);
          }).toList(),
          controller: _controller,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 5.0,
          labelStyle: TextStyle(height: 2),
        ),
      ),
      // body: TabBarView(
      //   controller: _controller,
      //   children: _tabValues.map((f) {
      //     return Container(
      //       child: Text(f),
      //     );
      //   }).toList(),
      // ),
    );
  }
}

/// Flutter code sample for TabController

// This example shows how to listen to page updates in [TabBar] and [TabBarView]
// when using [DefaultTabController].

const List<Tab> tabs = <Tab>[
  Tab(text: '语文'),
  Tab(text: '英语'),
  Tab(text: '化学'),
  Tab(text: '物理'),
  Tab(text: '数学'),
  Tab(text: '生物'),
  Tab(text: '体育'),
  Tab(text: '经济'),
];

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          print(
              "previousIndex:  ${tabController.previousIndex}  Index:  ${tabController.index}  ");
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
            Toast.showCenter(context, "index: ${tabController.index}");
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Text("玉树"),
            bottom: const TabBar(
              tabs: tabs,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              labelColor: Colors.greenAccent,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 1.5,
              labelStyle: TextStyle(height: 2),
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  tab.text + ' Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

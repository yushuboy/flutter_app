import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _createSliver(3);
  }

  Widget _createSliver(int what) {
    if (what == 1) {
      return CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 65,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 5),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20),
        )
      ]);
    } else if (what == 2) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 30),
          )
        ],
      );
    } else if (what == 3) {
      return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 230.0,
            leading: Icon(Icons.menu),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('复仇者联盟'),
              background: Image.network(
                'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            children: List.generate(8, (index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }).toList(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Container(
                height: 85,
                alignment: Alignment.center,
                color: Colors.primaries[index % Colors.primaries.length],
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }, childCount: 25),
          )
        ],
      );
    }
    return null;
  }
}

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          leading: Icon(Icons.arrow_back_ios),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            centerTitle: true,
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[(index % 18)],
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('我是一个SliverPersistentHeader',
            style: TextStyle(color: Colors.white)));
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}

import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _createPageView(3);
  }

  Widget _createPageView(int what) {
    if (what == 1) {
      return PageView(
        scrollDirection: Axis.horizontal,
        controller: PageController(initialPage: 1),
        onPageChanged: (int index) {
          print("index: $index");
        },
        children: <Widget>[
          _MyPage(title: "MyPage1"),
          _MyPage(title: "MyPage2"),
          _MyPage(title: "MyPage3"),
        ],
      );
    } else if (what == 2) {
      return PageViewWidget();
    } else if (what == 3) {
      return ViewPage();
    }
    return null;
  }
}

class _MyPage extends StatelessWidget {
  final String title;

  const _MyPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreen[100], child: Center(child: Text(title)));
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageViewState();
}

class PageViewState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildPageView();
  }

  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];
  int _currentPageIndex = 0;

  _buildPageView() {
    return Center(
      child: Container(
        height: 230,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index % (pageList.length);
                });
              },
              itemCount: 10000,
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % (pageList.length)]);
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageList.length, (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex == i
                              ? Colors.blue
                              : Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageViewItem(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}

///********pageview切换动画**************///
class ViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var imgList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg',
    'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg'
  ];
  PageController _pageController;

  var _currPageValue = 0.0;

  //缩放系数
  double _scaleFactor = .8;

  //view page height
  double _height = 230.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height,
        alignment: Alignment.bottomCenter,
        child: PageView.builder(
          itemBuilder: (context, index) => _buildPageItem(index),
          itemCount: 10,
          controller: _pageController,
        ));
  }

  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //当前的item
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() + 1) {
      //右边的item
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() - 1) {
      //左边
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imgList[index % 2]), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

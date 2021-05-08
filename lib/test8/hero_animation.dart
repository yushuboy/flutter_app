import 'package:flutter/material.dart';

class HeroDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeroDemo();
}

///转场动画
class _HeroDemo extends State<HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new _Hero1Demo()));
              },
              child: Hero(
                tag: 'hero',
                child: Container(
                  child: Image.asset(
                    'assets/images/img_tip.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.red,
          );
        }),
      ),
    );
  }
}

class _Hero1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'hero',
            child: Container(
              child: Image.asset(
                'assets/images/img_tip.png',
              ),
            ),
          )),
    );
  }
}

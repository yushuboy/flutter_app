import 'package:flutter/material.dart';

class _Axis extends StatelessWidget {
  final Widget child;

  const _Axis({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey, width: 1),
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: child,
    );
  }
}

class _Cylinder extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const _Cylinder({Key key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      width: width,
      color: color,
    );
  }
}

class CylinderChart extends StatefulWidget {
  @override
  _CylinderChartState createState() => _CylinderChartState();
}

class _CylinderChartState extends State<CylinderChart> {
  final double _width = 20.0;
  List<double> _heightList = [60.0, 80.0, 100.0, 120.0, 140.0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 250,
        child: Stack(
          children: <Widget>[
            _Axis(),
            Positioned.fill(
              left: 5,
              right: 5,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(_heightList.length, (index) {
                    return _Cylinder(
                      height: _heightList[index],
                      width: _width,
                      color: Colors.primaries[index % Colors.primaries.length],
                    );
                  })),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: OutlinedButton(
                child: Text('反转'),
                onPressed: () {
                  setState(() {
                    _heightList = _heightList.reversed.toList();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

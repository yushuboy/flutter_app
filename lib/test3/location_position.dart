import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: _createContainer(6));
  }

  Widget _createContainer(int what) {
    if (what == 1) {
      return Container(
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          color: Colors.red,
          child: Text('老孟'),
        ),
      );
    } else if (what == 2) {
      return Container(
        child: Text(
          '老孟，专注分享Flutter技术及应用',
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue),
      );
    } else if (what == 3) {
      return Container(
        child: Text('老孟，专注分享Flutter技术及应用'),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 2),
        ),
      );
    } else if (what == 4) {
      return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.blue, width: 1.5),
          // borderRadius: BorderRadius.circular(12),
          //borderRadius和shape只能二选一
          shape: BoxShape.circle,
        ),
      );
    } else if (what == 5) {
      return Container(
        color: Colors.blue,
        child: Text(
          '老孟，专注分享Flutter技术及应用',
          style: TextStyle(color: Colors.white),
        ),
        alignment: Alignment.center,
        //比如在距离左上角1/4处
        // alignment: Alignment(-.5, -.5),
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: 250,
          minHeight: 100,
          minWidth: 100,
        ),
      );
    } else if (what == 6) {
      return Container(
        height: 300,
        width: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.red,
          ),
        ),
      );
    } else if (what == 7) {
      return Container(
        height: 200,
        width: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        //FractionallySizedBox 是一个相对父组件尺寸的组件，比如占父组件的80%：
        child: FractionallySizedBox(
          widthFactor: .8,
          heightFactor: .3,
          child: Container(
            color: Colors.red,
          ),
        ),
      );
    }
    return null;
  }
}

import 'package:flutter/material.dart';

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
          child: _createImage(6),
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget _createImage(int what) {
    if (what == 1) {
      return Container(
        color: Colors.red.withOpacity(.3),
        child: Image.asset(
          'assets/images/ic_loading.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      );
    } else if (what == 2) {
      return Image.network(
        'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg',
      );
    } else if (what == 3) {
      return Image.asset(
        'assets/images/ic_loading.png',
        width: double.infinity,
        height: 150,
        repeat: ImageRepeat.repeatX,
      );
    } else if (what == 4) {
      return Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
        frameBuilder: (BuildContext context, Widget child, int frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            child: child,
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 2),
            curve: Curves.easeOut,
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      );
    } else if (what == 5) {
      return Container(
        width: 200,
        padding: EdgeInsets.only(left: 8, top: 8, right: 20, bottom: 8),
        decoration: BoxDecoration(
            image: DecorationImage(
                centerSlice: Rect.fromLTWH(20, 20, 1, 1),
                image: AssetImage('assets/images/chat.png'),
                fit: BoxFit.fill)),
        child: Text(
          '老孟，专注分享Flutter技术和应用实战。'
              '老孟，专注分享Flutter技术和应用实战。'
              '老孟，专注分享Flutter技术和应用实战。',
        ),
      );
    } else if (what == 6) {
      return Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/ic_loading.png'),
                  fit: BoxFit.cover)),
        ),
      );
    }
  }
}

import 'package:flutter/gestures.dart';
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
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.red, fontSize: 24),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Example"),
        ),
        // body: TextField(
        //   decoration: InputDecoration(
        //       icon: Icon(Icons.person),
        //       hintText: "输入用户名",
        //       labelText: "姓名:",
        //       labelStyle: TextStyle(color: Colors.red)),
        // ),
        body: _createRich2(),
      ),
    );
  }

  Widget _createGradient() {
    return Builder(
      builder: (BuildContext context) {
        RenderBox box = context.findRenderObject();
        final Shader linearGradient = LinearGradient(
          colors: <Color>[Colors.purple, Colors.blue],
        ).createShader(Rect.fromLTWH(
            0.0, 0.0, box?.size?.width ?? 0, box?.size?.height ?? 0));
        return Text(
          '老孟，专注分享Flutter技术和应用实战',
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient),
        );
      },
    );
  }

  Widget _createRichText(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <InlineSpan>[
            WidgetSpan(
                child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue),
              child: Text(
                '判断题',
                style: TextStyle(color: Colors.white),
              ),
            )),
            TextSpan(
                text: '泡沫灭火器可用于带电灭火', style: TextStyle(color: Colors.grey)),
          ]),
    );
  }

  Widget _createRich() {
    return Text.rich(
      TextSpan(
          text: '登录即代表同意并阅读',
          style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
          children: [
            TextSpan(
              text: '《服务协议》111',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('onTap');
                },
            ),
          ]),
    );
  }

  Widget _createRich2() {
    return Text.rich(
      TextSpan(
          text: '回复',
          style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
          children: [
            TextSpan(
              text: '@老孟：',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('onTap');
                },
            ),
            TextSpan(
              text: '你好，想知道Flutter发展前景如何？',
            ),
          ]),
    );
  }
}

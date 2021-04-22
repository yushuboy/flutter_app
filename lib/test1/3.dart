import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: _createQQText(),
      ),
    );
  }

  Widget _createTextField() {
    return TextField(
      decoration: InputDecoration(
          helperText: '用户名长度为6-10个字母',
          helperStyle: TextStyle(color: Colors.blue),
          helperMaxLines: 1,
          hintText: '请输入用户名',
          hintStyle: TextStyle(color: Colors.grey),
          hintMaxLines: 1,
          errorText: '用户名输入错误',
          errorStyle: TextStyle(fontSize: 12),
          errorMaxLines: 1,
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          prefixIcon: Icon(Icons.person)),
    );
  }

  Widget _createNameEdit() {
    return Container(
      height: 50,
      width: 250,
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color(0x30cccccc),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          hintText: 'QQ号/手机号/邮箱',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }

  Widget _createQQText() {
    return Container(
      height: 60,
      width: 250,
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("[a-zA-Z0-9]"), allow: true),
        ],
        decoration: InputDecoration(
          fillColor: Color(0x30cccccc),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          hintText: 'QQ号/手机号/邮箱',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
        obscureText: true,
        onChanged: (value){
          print('onChanged:$value');
        },
        onEditingComplete: (){
          print('onEditingComplete');
        },
        onTap: (){
          print('onTap');
        },
      ),
    );
  }
}

class CountTextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountTextState();
}

class _CountTextState extends State<CountTextWidget> {
  var _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          _textFieldValue = value;
        });
      },
      decoration: InputDecoration(counterText: '${_textFieldValue.length}/32'),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: _createIcon(),
    );
  }

  Widget _createImage() {
    return const Image(
      width: 50.0,
      height: 50.0,
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    );
  }

  Widget _createImage2() {
    return Image.network(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      width: 60,
      height: 60,
    );
  }

  Widget _createText(String _name) {
    return Text(
      'Hello, $_name! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _createIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        Icon(
          Icons.audiotrack,
          color: Colors.green,
          size: 24.0,
        ),
        Icon(
          Icons.beach_access,
          color: Colors.blue,
          size: 24.0,
        ),
      ],
    );
  }

}
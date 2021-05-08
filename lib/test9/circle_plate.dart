import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class CirclePlate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: CirclePlatePainter());
  }
}

class CirclePlatePainter extends CustomPainter {
  ///比例集合
  List<double> angles = [0.3, 0.3, 0.4];

  ///文案集合
  List<String> contents = ['Java', 'Android', 'Python'];

  ///颜色集合
  List<Color> colors = [Colors.yellow, Colors.red, Colors.blue];

  ///  声明一只画笔painter
  Paint _paint = Paint()
    ..color = Colors.red //颜色 红色
    ..strokeWidth = 3.0 // 宽度3.0
    ..isAntiAlias = true //是否抗锯齿 是
    ..style = PaintingStyle.fill; // 模式 填充

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    double startAngles = 0; //标记每个元素的其实角度
    //画扇形
    // _drawArc(canvas, rect, startAngles);
    // //画文字
    // _drawText(canvas, rect, startAngles, size);
    //心形
    _drawHeartShaped(canvas);
  }

  ///绘制文字
  void _drawText(Canvas canvas, Rect rect, double startAngles, Size size) {
    for (int i = 0; i < contents.length; i++) {
      canvas.save(); //这里先把canvas保存个副本，待会移动旋转完 好还原
      // 新建一个段落建造器，然后将文字基本信息填入;
      ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
        textAlign: TextAlign.left,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 15.0,
      ));
      pb.pushStyle(ui.TextStyle(color: Colors.white));
      pb.addText(contents[i]);
      // 设置文本的宽度约束
      ParagraphConstraints pc = ParagraphConstraints(width: 100);
      // 这里需要先layout,将宽度约束填入，否则无法绘制
      Paragraph paragraph = pb.build()..layout(pc);
      // 文字左上角起始点
      Offset offset = Offset(30, 0 - paragraph.height / 2); //由于没找到算文本宽度的方法，这里文本x轴的七点模拟写成 了60。
      canvas.translate(size.width / 2, size.height / 2); //先把canvas移动到中心点
      double roaAngle = 2 * pi * (startAngles + angles[i] / 2);
      canvas.rotate(roaAngle); //再将画布旋转一定角度，具体这个角度怎么来的， 稍微琢磨一下就明白了
      canvas.drawParagraph(paragraph, offset);
      canvas.restore(); //画完后重置 画布
      startAngles += angles[i]; //把当前元素角度累加
    }
  }

  ///绘制扇形
  void _drawArc(Canvas canvas, Rect rect, double startAngles) {
    for (int i = 0; i < angles.length; i++) {
      _paint..color = colors[i]; //取到颜色
      canvas.drawArc(rect, 2 * pi * startAngles, 2 * pi * angles[i], true, _paint);
      startAngles += angles[i];
    }
  }

  ///绘制心形
  void _drawHeartShaped(Canvas canvas) {
    Path path = new Path();
    var width = 200;
    var height = 300;
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 12) / 13, (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path, _paint);

    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 13, (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; //true为需要重绘
  }
}

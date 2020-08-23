import 'package:flutter/material.dart';

class ChartLineView extends StatelessWidget {
  double width, height;

  ChartLineView({this.height, this.width});

  List<Pair> points = [
    Pair(0, 0.5),
    Pair(0.1, 1),
    Pair(0.2, 0.5),
    Pair(0.3, 1),
    Pair(0.4, 0.5),
    Pair(0.5, 1),
    Pair(0.6, 0.5),
    Pair(0.7, 1),
    Pair(0.8, 0.5),
    Pair(0.9, 1),
    Pair(1, 0.5)
  ];

  List<Pair> line = [
    Pair(0, 0.5),
    Pair(0.1, 1),
    Pair(0.2, 0.5),
    Pair(0.3, 1),
    Pair(0.4, 0.5),
    Pair(0.5, 1),
    Pair(0.6, 0.5),
    Pair(0.7, 1),
    Pair(0.8, 0.5),
    Pair(0.9, 1),
    Pair(1, 0.5)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.8,
      child: CustomPaint(
        painter: _ChartLine(points, line),
      ),
    );
  }
}

class Pair {
  double index, value;

  Pair(this.index, this.value);
}

class _ChartLine extends CustomPainter {
  Path path = Path();
  List<Pair> line, points;
  Paint mPaint = Paint();

  _ChartLine(this.points, this.line) {
    mPaint.isAntiAlias = true;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    mPaint.color = Color.fromARGB(255, 131, 117, 243);
    mPaint.style = PaintingStyle.stroke;
    mPaint.strokeCap = StrokeCap.round;
    mPaint.strokeWidth = 10;
    points.forEach((pair) {
      canvas.drawLine(Offset(size.width * pair.index, size.height),
          Offset(size.width * pair.index, size.height * (1 - pair.value)), mPaint);
    });
    mPaint.strokeWidth = 4;
    mPaint.strokeJoin = StrokeJoin.round;
    path.reset();

    mPaint.color = Colors.amber;
    path.moveTo(line[0].index * size.width, size.height * (1 - line[0].value));

    for (int i = 0; i < line.length; i++) {
      if (i + 2 < line.length) {
        Offset control = Offset(line[i + 1].index * size.width, size.height * (1 - line[i + 1].value));
        Offset offset1 = between(line[i].index * size.width, size.height * (1 - line[i].value),
            line[i + 1].index * size.width, size.height * (1 - line[i + 1].value));
        Offset offset2 =
            between(control.dx, control.dy, line[i + 2].index * size.width, size.height * (1 - line[i + 2].value), isEnd: false);
        path.lineTo(offset1.dx, offset1.dy);
        path.quadraticBezierTo(control.dx, control.dy, offset2.dx, offset2.dy);
      } else if (i + 1 < line.length) {
        path.lineTo(line[i + 1].index * size.width, size.height * (1 - line[i + 1].value));
      }
    }
    canvas.drawPath(path, mPaint);
  }

  Offset between(double srcX, double srcY, double dstX, double dstY, {bool isEnd = true}) {
    if (isEnd) {
      return Offset(srcX + (dstX - srcX) * 0.7, srcY + (dstY - srcY) * 0.7);
    } else {
      return Offset(srcX + (dstX - srcX) * 0.3, srcY + (dstY - srcY) * 0.3);
    }
  }
}

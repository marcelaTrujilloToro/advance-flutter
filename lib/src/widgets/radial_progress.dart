import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryStroke;
  final double primaryStroke;

  const RadialProgress({
    super.key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.secondaryStroke = 4,
    this.primaryStroke = 10,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  double? percentagePrev;

  @override
  void initState() {
    percentagePrev = widget.percentage;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller?.forward(from: 0.0);

    final diffAnimate = widget.percentage - percentagePrev!;
    percentagePrev = widget.percentage;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgressPainter(
                (widget.percentage - diffAnimate) +
                    (diffAnimate * controller!.value),
                widget.primaryColor,
                widget.secondaryColor,
                widget.secondaryStroke,
                widget.primaryStroke),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double radialProgress;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryStroke;
  final double primaryStroke;

  _RadialProgressPainter(
    this.radialProgress,
    this.primaryColor,
    this.secondaryColor,
    this.secondaryStroke,
    this.primaryStroke,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    final Gradient gradient = LinearGradient(colors: <Color>[
      primaryColor,
      Colors.white,
    ]);

    //circulo completo
    final paint = Paint()
      ..strokeWidth = secondaryStroke
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    //arco

    final paintArc = Paint()
      ..strokeWidth = primaryStroke
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (radialProgress / 100);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

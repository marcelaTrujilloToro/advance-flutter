import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller.addListener(() {
      // print('valor controller ${controller.value}');

      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            percentage = 0;
            newPercentage = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(
          Icons.refresh_rounded,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(5),
          child: CustomPaint(
            painter: _RadialProgressPainter(percentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final radialProgress;

  _RadialProgressPainter(this.radialProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //circulo completo
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    //arco

    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //parte que se debe ir llenando
    double arcAngle = 2 * pi * (radialProgress / 100);

    canvas.drawArc(
      // rect espacio donde se quiere poner
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

import 'package:flutter/material.dart';

class CuadradoAnimagoPage extends StatelessWidget {
  const CuadradoAnimagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.25, curve: Curves.bounceOut),
    ));

    moveUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.25, 0.5, curve: Curves.bounceOut),
    ));

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 0.75, curve: Curves.bounceOut),
    ));

    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.75, 1, curve: Curves.bounceOut),
    ));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
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
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRentagle) {
        return Transform.translate(
          offset: Offset(
              moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: childRentagle,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

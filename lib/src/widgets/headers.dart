import 'package:flutter/material.dart';

// header cuadrado
class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xFF615AAB),
    );
  }
}

// header con bordes inferiores redondeados
class RounderHeader extends StatelessWidget {
  const RounderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xFF615AAB),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
    );
  }
}

// header inclinado
class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.09,
      child: Container(
        height: 300,
        // no importa el ancho que le ponga ya que se usa el maximo del dispositivo y nunca se va a terminar de verr como necesitamos
        width: 1000,
        color: const Color(0xFF615AAB),
      ),
    );
  }
}

// header diagonal con custom painter
class DiagonalCustomHeader extends StatelessWidget {
  const DiagonalCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // paint es el lapiz con el que se dibuja
    final paint = Paint();

    //propiedades del lapiz
    paint.color = const Color(0xFF615AAB);

    //? el fill rellena la figura que se haga, el stroke solo es los contornos
    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 2;

    final path = Path();

    //Dibujar con el path y el lapiz
    //? el move solo ubica el lapiz, no pinta
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// triangulo
class TriangularCustomHeader extends StatelessWidget {
  const TriangularCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 2;

    final path = Path();

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, 0);

    //? dibja lo mismo que las lineas anteriores pero en solo dos lineas,
    //?ya que flutter infiere que ya ahi debe llenar la figura
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// pico
class PicoCustomHeader extends StatelessWidget {
  const PicoCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// con curvatura
class CurvoCustomHeader extends StatelessWidget {
  const CurvoCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// con efecto ola
class WaveCustomHeader extends StatelessWidget {
  const WaveCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF615AAB);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 30;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

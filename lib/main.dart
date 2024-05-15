import 'package:flutter/material.dart';
import 'package:disenos/src/challenge/cuadrado_animado_page.dart';
// import 'package:disenos/src/pages/animations_page.dart';
// import 'package:disenos/src/pages/headers_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CuadradoAnimagoPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
// import 'package:disenos/src/labs/slideshow_page.dart';
// import 'package:disenos/src/pages/circular_graphics_page.dart';
// import 'package:disenos/src/labs/circular_progress_page.dart';
// import 'package:disenos/src/challenge/cuadrado_animado_page.dart';
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
      home: SlideshowPage(),
    );
  }
}

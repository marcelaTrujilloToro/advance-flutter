import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) {
                percentage = 0;
              }
            });
          },
          child: const Icon(Icons.refresh_rounded),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage * 1,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                    percentage: percentage * 1.2, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    percentage: percentage * 2, color: Colors.pink),
                CustomRadialProgress(
                    percentage: percentage * 4, color: Colors.purple)
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    super.key,
    required this.percentage,
    required this.color,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return SizedBox(
      width: 150,
      height: 150,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        secondaryColor: appTheme.colorScheme.secondary,
        secondaryStroke: 4,
        primaryStroke: 10,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  const EmergencyHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _EmergencyHeaderBackground(
          color1: color1,
          color2: color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              subTitle,
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _EmergencyHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _EmergencyHeaderBackground({
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
        ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              color1,
              color2,
            ]),
      ),
    );
  }
}

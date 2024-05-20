import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: use_key_in_widget_constructors
class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const FaIcon(
          FontAwesomeIcons.play,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            active = true;
          });
        },
      ),
      backgroundColor: const Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: active,
          from: 30,
          duration: const Duration(seconds: 1),
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}

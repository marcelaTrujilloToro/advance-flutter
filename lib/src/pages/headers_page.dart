import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: WaveCustomHeader(color: appTheme.primaryColor),
    );
  }
}

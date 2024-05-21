import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(primaryColor: Colors.pink);

        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(primaryColor: Colors.pink);

        break;

      case 3:
        _darkTheme = false;
        _customTheme = true;

        break;
      default:
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(primaryColor: Colors.pink);
    } else {
      _currentTheme = ThemeData.light().copyWith(primaryColor: Colors.pink);
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          primaryColor: const Color(0xff48a0eb),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202b),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)));
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}

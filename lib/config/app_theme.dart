import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(68, 21, 177, 177);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Los colores solo se pueden seleccionar hasta ${_colorThemes.length}',
        );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light,
    );
  }
}
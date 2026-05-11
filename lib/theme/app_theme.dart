import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: Colors.grey.shade100,

    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
  );
}

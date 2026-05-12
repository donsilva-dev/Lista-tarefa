import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: false,

    //primaryColor: Colors.blue,
    colorScheme: ColorScheme.light(primary: Colors.deepPurple.shade800),

    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
    scaffoldBackgroundColor: Colors.grey.shade100,

    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      elevation: 0,
    ),
  );
}

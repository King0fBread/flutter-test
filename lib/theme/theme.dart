import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.grey,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orangeAccent,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        )),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        labelSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15
        )
    )
);
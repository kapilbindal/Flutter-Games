import 'package:flutter/material.dart';
import 'package:memory_monarch/utils/config/theme.dart';
import 'package:memory_monarch/views/home/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: gameTheme,
      home: HomePage(),
    );
  }
}

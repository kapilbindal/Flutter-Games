import 'package:flutter/material.dart';
import 'package:memory_monarch/utils/constants/strings.dart';

class MyColors {
  MyColors._();
  static Map<String, Color> widgetColor = {
    Strings.theme_zoo: Colors.brown[900],
    Strings.theme_hum_tum: Colors.pink[800],
    Strings.choose_theme: Colors.red,
    Strings.game_over: Colors.red,
    Strings.score: Colors.green,
  };
}

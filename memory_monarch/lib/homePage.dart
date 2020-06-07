import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:memory_monarch/customCardView.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/gameView.dart';
import 'package:memory_monarch/models/chooseThemeView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Memory Monarch",
          style: TextStyle(
            fontFamily: "serif",
            fontWeight: FontWeight.w800,
            fontSize: 25.0,
            color: Colors.brown[700],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFffa100),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/animals/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ChooseThemeView(),
      ),
    );
  }
}

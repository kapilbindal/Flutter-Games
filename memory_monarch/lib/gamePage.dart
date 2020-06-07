import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_monarch/customCardView.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/gameView.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  callback(bool startGame) {
    setState(() {});
  }

  Timer _timer;
  int _start = 3;

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.brown[700],
            ),
            onPressed: () => Navigator.of(context).pop()),
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
        child: Column(
          children: <Widget>[
            CustomCardView(
              height: 70,
              width: width,
              backColor: Colors.white,
              text: theme == "zoo" ? "ZOOTOPIA" : "HUM TUM",
              fontSize: 35.0,
              fontFamily: "geneva",
              fontColor: theme == "zoo" ? Colors.brown[900] : Colors.red,
            ),
            SizedBox(height: 20),
            Expanded(
                child: _start != 0
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "Get Ready \n $_start",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 60.0,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Scoreline
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "$viewPoints/800",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Points",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "$flipCount",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Flips Left",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GameView(
                            callbackMain: callback,
                          ),
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}

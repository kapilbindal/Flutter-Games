import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/models/card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> visiblePairs = List<CardModel>();
  List<CardModel> questionPairs = List<CardModel>();

  @override
  void initState() {
    super.initState();
    restart();
  }

  void restart() {
    pairs = getPairs(); // sab True
    pairs.shuffle();
    visiblePairs = pairs;
    viewPoints = 0;
    totalPoints = 0;
    flipCount = 30;
    allowClick = false;
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        hideAllPairs(visiblePairs); // sab false
        allowClick = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Memory Monarch",
          style: TextStyle(
            fontFamily: "serif",
            fontWeight: FontWeight.w800,
            fontSize: 25.0,
            color: Color(0xFFa16525),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFffa100),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/animals/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "$viewPoints/800",
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "Points",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white60,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "$flipCount",
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "Flips Left",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity:
                            (totalPoints == 800 || flipCount == 0) ? 0.3 : 1,
                        duration: Duration(seconds: 1),
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 10.0,
                            maxCrossAxisExtent: 100.0,
                          ),
                          children: List.generate(
                            visiblePairs.length,
                            (index) {
                              return Card(
                                imagePath: visiblePairs[index].getImagePath(),
                                isSelected: visiblePairs[index].getIsSelected(),
                                isMatched: visiblePairs[index].getIsMatched(),
                                index: index,
                                parent: this,
                              );
                            },
                          ),
                        ),
                      ),
                      totalPoints == 800 || flipCount == 0
                          ? Container(
                              color: Colors.white70,
                              height: 250.0,
                              width: 350.0,
                              margin: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    (flipCount == 0 && totalPoints != 800)
                                        ? "GAME OVER"
                                        : "SCORE: $viewPoints",
                                    style: TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: "geneva",
                                      color:
                                          (flipCount == 0 && totalPoints != 800)
                                              ? Colors.red
                                              : Colors.green,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  RaisedButton(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    color: Color(0xFFffa100),
                                    onPressed: () {
                                      setState(() {
                                        restart();
                                      });
                                    },
                                    child: Text(
                                      "REPLAY",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  String imagePath;
  bool isSelected;
  bool isMatched;
  int index;
  _HomePageState parent;
  Card(
      {this.imagePath,
      this.isSelected,
      this.isMatched,
      this.index,
      this.parent});

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.index);
        print(allowClick);
        print(widget.isSelected);

        if (allowClick) {
          setState(() {
            // open Card
            widget.isSelected = true;
          });
          // One Card opened
          if (selectedImagePath.length != 0 &&
              selectedImageIndex != widget.index) {
            allowClick = false;
            flipCount = max(flipCount - 2, 0);
            Future.delayed(const Duration(seconds: 1), () {
              allowClick = true;
              // Matched
              if (selectedImagePath == widget.imagePath) {
                totalPoints += 100;
                viewPoints += 100;
                widget.parent.setState(() {
                  widget.parent.visiblePairs[selectedImageIndex]
                      .setIsMatched(true);
                  widget.parent.visiblePairs[widget.index].setIsMatched(true);
                });
              }
              //Not Matched
              else {
                viewPoints = max(0, viewPoints - 10);
                widget.parent.setState(() {
                  widget.parent.visiblePairs[selectedImageIndex]
                      .setIsSelected(false);
                  widget.parent.visiblePairs[widget.index].setIsSelected(false);
                });
              }
              selectedImagePath = "";
            });
          }
          // No card Open
          else {
            selectedImagePath = widget.imagePath;
            selectedImageIndex = widget.index;
          }
        }
      },
      child: widget.isMatched
          ? Container()
          : Container(
              color: Colors.black26,
              margin: EdgeInsets.all(5.0),
              child: Image.asset(
                  widget.isSelected ? widget.imagePath : hideImagePath),
            ),
    );
  }
}

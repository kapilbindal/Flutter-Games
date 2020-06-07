import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/models/card.dart';

class CardView extends StatefulWidget {
  int index;
  List<CardModel> visiblePairs;
  Function callbackGameView;

  CardView({
    this.index,
    this.visiblePairs,
    this.callbackGameView,
  });

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowClick) {
          // open Card
          setState(() {
            widget.visiblePairs[widget.index].setIsSelected(true);
          });
          // One Card opened
          if (selectedImagePath.length != 0 &&
              selectedImageIndex != widget.index) {
            allowClick = false;
            flipCount = max(flipCount - 2, 0);
            Future.delayed(const Duration(seconds: 1), () {
              allowClick = true;
              // Matched
              if (selectedImagePath ==
                      widget.visiblePairs[widget.index].imagePath ||
                  selectedImagePath.substring(selectedImagePath.length - 5,
                          selectedImagePath.length - 4) ==
                      widget.visiblePairs[widget.index].imagePath.substring(
                          widget.visiblePairs[widget.index].imagePath.length -
                              5,
                          widget.visiblePairs[widget.index].imagePath.length -
                              4)) {
                totalPoints += 100;
                viewPoints += 100;
                widget.visiblePairs[selectedImageIndex].setIsMatched(true);
                widget.visiblePairs[widget.index].setIsMatched(true);
              }
              //Not Matched
              else {
                viewPoints = max(0, viewPoints - 10);
                widget.visiblePairs[selectedImageIndex].setIsSelected(false);
                widget.visiblePairs[widget.index].setIsSelected(false);
              }
              // Callback for the change happened after "Future"
              widget.callbackGameView(widget.visiblePairs);
              selectedImagePath = "";
            });
          }
          // No card Open
          else {
            selectedImagePath = widget.visiblePairs[widget.index].imagePath;
            selectedImageIndex = widget.index;
          }
          if (totalPoints == 800 || flipCount == 0) allowClick = false;
        }
      },
      child: widget.visiblePairs[widget.index].isMatched
          ? Container()
          : Container(
              //color: Colors.black26,
              margin: EdgeInsets.all(5.0),
              child: ClipOval(
                child: Image.asset(
                  widget.visiblePairs[widget.index].isSelected
                      ? widget.visiblePairs[widget.index].imagePath
                      : hideImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}

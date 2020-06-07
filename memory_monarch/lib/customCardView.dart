import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  double height, width, fontSize;
  String text, fontFamily;
  Color backColor, fontColor, tileColor;
  bool showTile;

  CustomCardView({
    this.height,
    this.width,
    this.text,
    this.fontColor,
    this.backColor,
    this.tileColor,
    this.fontFamily,
    this.fontSize,
    this.showTile = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        color: backColor,
        child: Row(
          children: <Widget>[
            showTile ? Container(color: tileColor, width: 30) : Container(),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                    color: fontColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

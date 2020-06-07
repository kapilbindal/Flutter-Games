import 'package:flutter/material.dart';
import 'package:memory_monarch/customCardView.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/gamePage.dart';

class ChooseThemeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomCardView(
            height: 75,
            width: width,
            backColor: Colors.black87,
            text: "CHOOSE YOUR THEME",
            fontSize: 25.0,
            fontFamily: "geneva",
            fontColor: Colors.red,
          ),
          GestureDetector(
            onTap: () {
              theme = "zoo";
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              backColor: Colors.white,
              showTile: true,
              tileColor: Colors.green,
              text: "ZOOTOPIA",
              fontSize: 35.0,
              fontFamily: "geneva",
              fontColor: Colors.brown[900],
            ),
          ),
          GestureDetector(
            onTap: () {
              theme = "hum tum";
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              backColor: Colors.white,
              showTile: true,
              tileColor: Colors.amber,
              text: "HUM TUM",
              fontSize: 35.0,
              fontFamily: "geneva",
              fontColor: Colors.pink[800],
            ),
          ),
        ],
      ),
    );
  }
}

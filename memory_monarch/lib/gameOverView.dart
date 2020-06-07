import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/homePage.dart';

class GameOverView extends StatelessWidget {
  Function callbackGameView;
  GameOverView({this.callbackGameView});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 350.0,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                color: (flipCount == 0 && totalPoints != 800)
                    ? Colors.red
                    : Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.white70,
                  onPressed: () {
                    callbackGameView();
                  },
                  child: Text(
                    "REPLAY",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.green[700],
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                RaisedButton(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.white70,
                  onPressed: () {
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "HOME",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/utils/constants/colors.dart';
import 'package:memory_monarch/utils/constants/strings.dart';
import 'package:memory_monarch/views/home/homePage.dart';

class GameOverView extends StatelessWidget {
  Function callbackGameView;
  GameOverView({this.callbackGameView});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 330.0,
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
                  ? Strings.game_over
                  : Strings.score + " : $viewPoints",
              style: TextStyle(
                fontSize: 35.0,
                fontFamily: Strings.font_family,
                color: (flipCount == 0 && totalPoints != 800)
                    ? MyColors.widgetColor[Strings.choose_theme]
                    : MyColors.widgetColor[Strings.score],
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 70),
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
                    Strings.restart,
                    style: Theme.of(context).textTheme.button,
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
                    Strings.return_home,
                    style: Theme.of(context).textTheme.button,
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

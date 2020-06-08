import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/utils/constants/colors.dart';
import 'package:memory_monarch/utils/constants/strings.dart';
import 'package:memory_monarch/views/game/widgets/gameView.dart';
import 'package:memory_monarch/views/home/widgets/customCardView.dart';

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
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          Strings.app_name,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Strings.background_img_path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            CustomCardView(
              height: 70,
              width: width,
              text: theme,
              fontColor: theme == Strings.theme_zoo
                  ? MyColors.widgetColor[Strings.theme_zoo]
                  : MyColors.widgetColor[Strings.theme_hum_tum],
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
                        Strings.get_ready + "\n $_start",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1,
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
                                  "$viewPoints/" + Strings.max_points,
                                  style: Theme.of(context).textTheme.display1,
                                ),
                                Text(
                                  Strings.points,
                                  style: Theme.of(context).textTheme.display2,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "$flipCount",
                                  style: Theme.of(context).textTheme.display1,
                                ),
                                Text(
                                  Strings.flips_left,
                                  style: Theme.of(context).textTheme.display2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GameView(
                          callbackMain: callback,
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

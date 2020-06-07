import 'package:flutter/material.dart';
import 'package:memory_monarch/cardView.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/gameOverView.dart';
import 'package:memory_monarch/models/card.dart';

class GameView extends StatefulWidget {
  Function callbackMain;
  GameView({this.callbackMain});
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  List<CardModel> visiblePairs = List<CardModel>();
  List<CardModel> questionPairs = List<CardModel>();

  @override
  void initState() {
    super.initState();
    restart();
  }

  void restart() {
    pairs = theme == "zoo" ? getAnimalPairs() : getCelebPairs(); // sab True
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

  callbackGameView(List<CardModel> updatedVisiblePairs) {
    widget.callbackMain(false);
    setState(() {
      visiblePairs = updatedVisiblePairs;
    });
  }

  callbackFromGameOverView() {
    restart();
    widget.callbackMain(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: (totalPoints == 800 || flipCount == 0) ? 0.3 : 1,
            duration: Duration(seconds: 1),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 10.0,
                maxCrossAxisExtent: 100.0,
              ),
              children: List.generate(
                visiblePairs.length,
                (index) {
                  return CardView(
                    visiblePairs: visiblePairs,
                    callbackGameView: callbackGameView,
                    index: index,
                  );
                },
              ),
            ),
          ),
          totalPoints == 800 || flipCount == 0
              ? GameOverView(
                  callbackGameView: callbackFromGameOverView,
                )
              : Container(),
        ],
      ),
    );
  }
}

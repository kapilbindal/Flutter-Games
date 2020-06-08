import 'package:flutter/material.dart';
import 'package:memory_monarch/data/data.dart';
import 'package:memory_monarch/utils/constants/colors.dart';
import 'package:memory_monarch/utils/constants/strings.dart';
import 'package:memory_monarch/views/game/gamePage.dart';
import 'package:memory_monarch/views/home/widgets/customCardView.dart';

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
            text: Strings.choose_theme,
            fontSize: 25.0,
            fontColor: MyColors.widgetColor[Strings.choose_theme],
          ),
          InkWell(
            onTap: () {
              theme = Strings.theme_zoo;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              showTile: true,
              tileColor: Colors.green,
              text: Strings.theme_zoo,
              fontColor: MyColors.widgetColor[Strings.theme_zoo],
            ),
          ),
          InkWell(
            onTap: () {
              theme = Strings.theme_hum_tum;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              showTile: true,
              tileColor: Colors.amber,
              text: Strings.theme_hum_tum,
              fontColor: MyColors.widgetColor[Strings.theme_hum_tum],
            ),
          ),
        ],
      ),
    );
  }
}

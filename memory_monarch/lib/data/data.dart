import 'package:memory_monarch/models/card.dart';

int viewPoints = 0;
int totalPoints = 0;
int flipCount = 30;
bool allowClick = false;
String hideImagePath = "assets/animals/question.png";
String selectedImagePath = "";
int selectedImageIndex;
List<CardModel> pairs = List<CardModel>();

void hideAllPairs(List<CardModel> visibleList) {
  for (int i = 0; i < visibleList.length; i++) {
    visibleList[i].setIsSelected(false);
  }
}

List<CardModel> getPairs() {
  List<CardModel> pairs = List<CardModel>();
  List<String> imgNames = [
    "dog",
    "frog",
    "monkey",
    "panda",
    "rhino",
    "sloth",
    "tiger",
    "zebra"
  ];
  for (int i = 0; i < imgNames.length; i++) {
    CardModel card = CardModel();
    card.setImagePath("assets/animals/" + imgNames[i] + ".png");
    card.setIsSelected(true);
    card.setIsMatched(false);
    pairs.add(card);
    pairs.add(card);
  }
  return pairs;
}

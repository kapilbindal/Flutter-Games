import 'package:memory_monarch/models/card.dart';

int viewPoints = 0;
int totalPoints = 0;
int flipCount = 30;
bool allowClick = false;
String hideImagePath = "assets/animals/question.png";
String selectedImagePath = "";
int selectedImageIndex;
String theme = "";
List<CardModel> pairs = List<CardModel>();

void hideAllPairs(List<CardModel> visibleList) {
  for (int i = 0; i < visibleList.length; i++) {
    visibleList[i].setIsSelected(false);
  }
}

List<CardModel> getAnimalPairs() {
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
    CardModel cardCopy1 = CardModel();
    cardCopy1.setImagePath("assets/animals/" + imgNames[i] + ".png");
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
    CardModel cardCopy2 = CardModel();
    cardCopy2.setImagePath("assets/animals/" + imgNames[i] + ".png");
    cardCopy2.setIsSelected(true);
    cardCopy2.setIsMatched(false);
    pairs.add(cardCopy2);
  }
  return pairs;
}

List<CardModel> getCelebPairs() {
  List<CardModel> pairs = List<CardModel>();
  List<String> imgNames = [
    "virat_1",
    "anushka_1",
    "priyanka_2",
    "nick_2",
    "deepika_3",
    "ranveer_3",
    "divyanka_4",
    "vivek_4",
    "yuvi_5",
    "hazel_5",
    "shahid_6",
    "mira_6",
    "kareena_7",
    "saif_7",
    "hardik_8",
    "natasha_8",
  ];
  for (int i = 0; i < imgNames.length; i++) {
    CardModel cardCopy1 = CardModel();
    cardCopy1.setImagePath("assets/celebrity/" + imgNames[i] + ".png");
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
  }
  return pairs;
}

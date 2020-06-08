import 'package:memory_monarch/models/tile.dart';
import 'package:memory_monarch/utils/constants/strings.dart';

int viewPoints = 0;
int totalPoints = 0;
int flipCount = 30;
bool allowClick = false;
String hideImagePath = Strings.question_img_path;
String selectedImagePath = "";
int selectedImageIndex;
String theme = "";
List<TileModel> pairs = List<TileModel>();

void hideAllPairs(List<TileModel> visibleList) {
  for (int i = 0; i < visibleList.length; i++) {
    visibleList[i].setIsSelected(false);
  }
}

List<TileModel> getAnimalPairs() {
  List<TileModel> pairs = List<TileModel>();
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
    TileModel cardCopy1 = TileModel();
    cardCopy1.setImagePath(Strings.animal_img_dir_path + imgNames[i] + ".png");
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
    TileModel cardCopy2 = TileModel();
    cardCopy2.setImagePath(Strings.animal_img_dir_path + imgNames[i] + ".png");
    cardCopy2.setIsSelected(true);
    cardCopy2.setIsMatched(false);
    pairs.add(cardCopy2);
  }
  return pairs;
}

List<TileModel> getCelebPairs() {
  List<TileModel> pairs = List<TileModel>();
  List<String> imgNames = [
    "virat_1",
    "anushka_1",
    "priyanka_2",
    "nick_2",
    "deepika_3",
    "ranveer_3",
    "aishwarya_4",
    "abhishek_4",
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
    TileModel cardCopy1 = TileModel();
    cardCopy1.setImagePath(Strings.celeb_img_dir_path + imgNames[i] + ".png");
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
  }
  return pairs;
}

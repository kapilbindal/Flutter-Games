class TileModel {
  String imagePath;
  bool isSelected;
  bool isMatched;

  TileModel({this.imagePath, this.isSelected, this.isMatched});

  void setImagePath(String imgPath) {
    imagePath = imgPath;
  }

  void setIsSelected(bool isCardSelected) {
    isSelected = isCardSelected;
  }

  void setIsMatched(bool isCardMathched) {
    isMatched = isCardMathched;
  }

  String getImagePath() {
    return imagePath;
  }

  bool getIsSelected() {
    return isSelected;
  }

  bool getIsMatched() {
    return isMatched;
  }
}

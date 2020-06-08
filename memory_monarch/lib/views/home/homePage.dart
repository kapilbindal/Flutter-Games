import 'package:flutter/material.dart';
import 'package:memory_monarch/utils/constants/strings.dart';
import 'package:memory_monarch/views/home/widgets/chooseThemeView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
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
        child: ChooseThemeView(),
      ),
    );
  }
}

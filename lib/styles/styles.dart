import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Styles {

  ///Colors
  static const Color gradientColor1 = Color.fromRGBO(32, 165, 170, 1);
  static const Color gradientColor2 = Color.fromRGBO(25, 152, 116, 1);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color materialBackColor = Color.fromRGBO(247, 248, 249, 1);
  static const Color greenColor = Color.fromRGBO(5, 160, 75, 1);
  static const Color greyColor = Color.fromRGBO(193, 194, 202, 1);
  static const Color medianGreyColor = Color.fromRGBO(102, 102, 102, 1.0);
  static const Color lightGreyColor = Color.fromRGBO(245, 245, 245, 1);
  static const Color darkGreyColor = Color.fromRGBO(52, 52, 51, 1);
  static const Color redColor = Color.fromRGBO(225, 54, 47, 1);
  static const Color darkRedColor = Color(0xffe1362f);

  static const Color mainColor = Color.fromRGBO(32, 165, 170, 1);
  static const Color orangeColor = Color.fromRGBO(250, 162, 35, 1);
  static const Color ratingColor = Color.fromRGBO(255, 193, 7, 1);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.08);
  static const Color iconColor1 = Color.fromRGBO(27, 121, 124, 0.41);
  static const Color iconBackColor1 = Color.fromRGBO(32, 165, 170, 0.23);
  static const Color iconColor2 = Color.fromRGBO(4, 109, 114, 1);
  static const Color iconBackColor2 = Color.fromRGBO(232, 252, 253, 1);
  static const Color hintTextFieldColor = Color.fromRGBO(193, 194, 202, 1.0);
  static const Color secondaryColor = Color(0xfffaa522);
  static const Color thirdColor = Color.fromRGBO(32, 165, 170, 1.0);
  static const Color cyanColor = Color(0xff70fcff);

  ///Gradients
  static Gradient mainGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Styles.gradientColor1,
      Styles.gradientColor2,
    ],
  );

  ///TextStyles
  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 18,
    color: Styles.whiteColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle normalTextStyleBlack = TextStyle(
    fontFamily: "Dubai",
    fontSize: 16,
    color: Color.fromRGBO(50, 51, 51, 1.0),
  );
  static TextStyle hintTextFieldStyle =
      TextStyle(fontFamily: "Dubai", fontSize: 18, color: hintTextFieldColor);
  static TextStyle normalTextStyleThird = TextStyle(
    fontFamily: "Dubai",
    fontSize: 18,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );

  ///Icons
  static Widget appBarBackIcon = Icon(
    Icons.arrow_back_ios,
    size: 22,
    color: Styles.whiteColor,
  );
}

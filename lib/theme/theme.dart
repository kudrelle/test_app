import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double opacity = 0.7;

class AppColors {
  AppColors();
  // static const Color primary = const Color(0xff060606);
  static const Color white = const Color(0xffffffff);
  static const Color darkTextColor = const Color(0xff484848);
  static const Color greyLight = const Color(0xffF2F2F2);
  static const Color greyMediumText = const Color(0xff4B4B4B);
  static const Color greenReadMore = const Color(0xff007F84);
  static const Color pinkHeartColor = const Color(0xffFC595A);
  static const Color green = const Color(0xff568B2F);

  static getSecondaryColor(Color color) => color.withOpacity(opacity);
}

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  // primaryColor: AppColors.primary,
  // accentColor: AppColors.blueMain,
  // indicatorColor: AppColors.blueMain,
  // cursorColor: AppColors.blueMain,
  fontFamily: 'Roboto',
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class TextStyles {
  TextStyles();

  static TextStyle logoStyle =
      GoogleFonts.lato().copyWith(color: AppColors.darkTextColor, fontSize: 17);
  // static const TextStyle logoStyle = TextStyle(
  //     fontSize: 15.0, color: AppColors.white, fontWeight: FontWeight.w600);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 35.0, color: AppColors.white, fontWeight: FontWeight.bold);

  static const TextStyle titleStyleNormal = TextStyle(
      fontSize: 35.0, color: AppColors.white, fontWeight: FontWeight.w100);

  static const TextStyle titleMediumStyle = TextStyle(
      fontSize: 20.0,
      color: AppColors.darkTextColor,
      fontWeight: FontWeight.w600);

  static const TextStyle allCapsStyle = TextStyle(
      fontSize: 12.0, color: AppColors.white, fontWeight: FontWeight.bold);

  static const TextStyle baseStyle = TextStyle(
    fontSize: 15.0,
    color: AppColors.white,
  );

  static const TextStyle smallBaseStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.greyMediumText,
  );

  static const TextStyle baseTextStyle =
      TextStyle(fontSize: 17.0, color: AppColors.darkTextColor, height: 1.5);

  static const TextStyle baseBoldStyle = TextStyle(
      fontSize: 15.0, color: AppColors.white, fontWeight: FontWeight.bold);

  static const TextStyle baseSemiboldStyle = TextStyle(
      fontSize: 15.0, color: AppColors.white, fontWeight: FontWeight.w600);
}

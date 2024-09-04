import 'package:app_pragma_catbreeds/utils/util_colors.dart';
import 'package:flutter/material.dart';

abstract class UtilStylesText {
  static TextStyle splashTitle = const TextStyle(
      color: UtilColors.colorBase, fontFamily: 'Lovely', fontSize: 40);
  static TextStyle appBarTitle = const TextStyle(
      color: UtilColors.colorBase, fontFamily: 'Lovely', fontSize: 30);
  static TextStyle bodyTitle = const TextStyle(
      color: UtilColors.colorBase,
      fontFamily: 'Sispectly_Harmonies',
      fontSize: 14,
      fontWeight: FontWeight.w700);
  static TextStyle bodyTitleLink = const TextStyle(
      color: UtilColors.colorPrincipal,
      fontFamily: 'Sispectly_Harmonies',
      fontSize: 14,
      fontWeight: FontWeight.w700);
  static TextStyle bodySubTitle = const TextStyle(
      color: UtilColors.colorBase,
      fontFamily: 'Sispectly_Harmonies',
      fontSize: 12,
      fontWeight: FontWeight.w700);
}

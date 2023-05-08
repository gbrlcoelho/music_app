import 'package:flutter/material.dart';
import 'package:music_app/core/app/music_app_colors.dart';

class MusicAppTextStyles {
  MusicAppTextStyles._();

  static TextStyle get getNormalStyle => TextStyle(
        fontSize: 16,
        color: MusicAppColors.secondaryColor,
      );

  static TextStyle get getNormalBoldStyle =>
      getNormalStyle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get getTitleStyle =>
      getNormalBoldStyle.copyWith(fontSize: 24);

  static TextStyle get getSmallStyle => getNormalStyle.copyWith(fontSize: 12);
}

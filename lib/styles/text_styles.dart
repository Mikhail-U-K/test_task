import 'package:flutter/material.dart';
import 'package:test_task/styles/app_colors.dart';

class AppTextStyles {
  static TextStyle appNameStyle1 = const TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 30,
    color: AppColors.mainDark,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appNameStyle2 = const TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 25,
    color: AppColors.mainDark,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static TextStyle descritionStyle = const TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.mainDark);
}

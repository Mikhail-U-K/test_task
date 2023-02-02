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

  static TextStyle headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColors.mainDark,
  );

  static TextStyle headerStyle2 = const TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.mainDark,
  );

  static TextStyle nameStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: AppColors.mainDark,
  );

  static TextStyle duty = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: AppColors.textSecondary,
  );
}

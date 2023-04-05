import 'package:flutter/material.dart';
import 'package:remote_coach/constants/app_color.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle h1 = const TextStyle(
    fontSize: 29,
    color: AppColor.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle h3 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );

  static TextStyle bodyText1 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static TextStyle caption = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
}

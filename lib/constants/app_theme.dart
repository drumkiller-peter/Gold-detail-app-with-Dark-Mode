import 'package:flutter/material.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/constants/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColor.white,
    iconTheme: const IconThemeData(color: AppColor.primary),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColor.primary,
      textColor: AppColor.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.bgFillColorLight,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.h1.copyWith(color: AppColor.black),
      headlineMedium: AppTextTheme.h2.copyWith(color: AppColor.black),
      headlineSmall: AppTextTheme.h3.copyWith(color: AppColor.black),
      bodyLarge: AppTextTheme.bodyText1.copyWith(color: AppColor.black),
      bodyMedium: AppTextTheme.bodyText2.copyWith(color: AppColor.black),
      bodySmall: AppTextTheme.caption.copyWith(color: AppColor.black),
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColor.darkBg,
    iconTheme: const IconThemeData(color: AppColor.primary),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.bgFillColorDark,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColor.primary,
      textColor: AppColor.white,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.h1.copyWith(color: AppColor.white),
      headlineMedium: AppTextTheme.h2.copyWith(color: AppColor.white),
      headlineSmall: AppTextTheme.h3.copyWith(color: AppColor.white),
      bodyLarge: AppTextTheme.bodyText1.copyWith(color: AppColor.white),
      bodyMedium: AppTextTheme.bodyText2.copyWith(color: AppColor.white),
      bodySmall: AppTextTheme.caption.copyWith(color: AppColor.white),
    ),
    useMaterial3: true,
  );
}

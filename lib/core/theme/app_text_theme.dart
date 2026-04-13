import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    displaySmall: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    headlineLarge: TextStyle(
      fontSize: 32.sp,
      // fontFamily: AppFontFamily.gelasio,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    headlineMedium: TextStyle(
      fontSize: 28.sp,
      // fontFamily: AppFontFamily.gelasio,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      // fontFamily: AppFontFamily.gelasio,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    ),

    labelLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    labelMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),

    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = lightTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}

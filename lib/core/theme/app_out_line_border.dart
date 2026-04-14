import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppOutLineBorder {
  static OutlineInputBorder authEnable= OutlineInputBorder(
    borderRadius: BorderRadius.circular(25).r,
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  );
  static OutlineInputBorder authFocus= OutlineInputBorder(
    borderRadius: BorderRadius.circular(25).r,
    borderSide: BorderSide(color: AppColors.deepGray, width: 1),
  );
}
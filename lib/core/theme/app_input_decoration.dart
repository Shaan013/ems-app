import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:huge_basket/core/theme/app_out_line_border.dart';

import 'app_colors.dart';
import 'app_out_line_border.dart';

class AppInputDecoration {
  static InputDecoration auth({required String prefixText,Widget? prefix,Widget? prefixIcon,Widget? suffix}) => InputDecoration(
    hintText: prefixText,
    // prefix: (needDivider ?? false)?SizedBox(height:13,child: VerticalDivider(),):null,,

    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffix,
    suffixIconColor: Colors.grey,
    counterText: "",
    filled: true,
    fillColor: AppColors.deepGray,
    // enabled: false,
    enabledBorder:AppOutLineBorder.authEnable,
    focusedBorder:AppOutLineBorder.authFocus,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25).r,
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
  );
}

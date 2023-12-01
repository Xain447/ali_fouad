

import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:flutter/material.dart';

Text normalTextStyle({required String text, FontWeight? fontWeight, required double fontSize,
  bool? softWrap, Color? color, TextAlign? textAlign, int? maxLines, double? height, double? letterSpace,
  TextOverflow? textOverflow}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxLines ?? 1,
    overflow: textOverflow ?? TextOverflow.visible,
    softWrap: softWrap ?? true,
    style: TextStyle(
        fontSize: fontSize,
        fontFamily: StringManager.normalText,
        color: color ?? ColorManager.blackColor,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height ?? 0.0,
        letterSpacing: letterSpace ?? 0.0
    ),
  );
}

Text boldTextStyle({required String text, FontWeight? fontWeight, required double fontSize,
  bool? softWrap, Color? color, TextAlign? textAlign, int? maxLines, double? height, double? letterSpace,
  TextOverflow? textOverflow}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxLines ?? 1,
    overflow: textOverflow ?? TextOverflow.visible,
    softWrap: softWrap ?? true,
    style: TextStyle(
        fontSize: fontSize,
        fontFamily: StringManager.boldText,
        color: color ?? ColorManager.blackColor,
        fontWeight: fontWeight ?? FontWeight.bold,
        height: height ?? 0.0,
        letterSpacing: letterSpace ?? 0.0
    ),
  );
}

Text italicTextStyle({required String text, FontWeight? fontWeight, required double fontSize,
  bool? softWrap, Color? color, TextAlign? textAlign, int? maxLines, double? height, double? letterSpace,
  TextOverflow? textOverflow}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxLines ?? 1,
    overflow: textOverflow ?? TextOverflow.visible,
    softWrap: softWrap ?? true,
    style: TextStyle(
        fontSize: fontSize,
        fontFamily: StringManager.italicText,
        color: color ?? ColorManager.blackColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: height ?? 0.0,
        letterSpacing: letterSpace ?? 0.0
    ),
  );
}
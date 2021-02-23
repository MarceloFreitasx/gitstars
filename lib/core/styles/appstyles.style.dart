import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appcolors.style.dart';

class AppStyles {
  //
  //TextTheme
  //
  // HEADS
  static TextStyle get head1 => Get.context.textTheme.headline1.copyWith(fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle get head2 => Get.context.textTheme.headline2;
  //SUBTITLES
  static TextStyle get subtitle1 => Get.context.textTheme.subtitle1;
  static TextStyle get subtitle2 => Get.context.textTheme.subtitle2;
  //BODYS
  static TextStyle get body1 => Get.context.textTheme.bodyText1;
  static TextStyle get body2 => Get.context.textTheme.bodyText2;
  static TextStyle get body3 => Get.context.textTheme.bodyText1.copyWith(fontSize: 13);
  static TextStyle get body4 => Get.context.textTheme.bodyText2.copyWith(fontSize: 13);
  static TextStyle get body5 => Get.context.textTheme.bodyText2.copyWith(fontSize: 11);
  static TextStyle get body6 => Get.context.textTheme.bodyText2.copyWith(fontSize: 14);
  //CAPTIONS
  static TextStyle get caption1 => Get.context.textTheme.caption;
  static TextStyle get caption2 => Get.context.textTheme.caption.copyWith(fontWeight: FontWeight.bold);
  //PLACEHOLDERS
  static TextStyle get placeholder =>
      Get.context.textTheme.bodyText1.copyWith(fontStyle: FontStyle.italic, color: AppColors.GRAY8A);
  //VALUES
  static TextStyle get value1 => Get.context.textTheme.headline2.copyWith(fontSize: 28);
  static TextStyle get value2 => Get.context.textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal);

  //
  // General
  //
  static const INPUT_PADDING = EdgeInsets.symmetric(horizontal: 10, vertical: 14);

  static const SPINNER_TEXT = TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black87);
}

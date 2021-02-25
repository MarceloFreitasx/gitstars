import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  //
  //TextTheme
  //
  // HEADS
  static TextStyle get head1 => Get.context.textTheme.headline1.copyWith(fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle get head2 => Get.context.textTheme.headline2;
  //SUBTITLES
  static TextStyle get subtitle1 => Get.context.textTheme.subtitle1;
  //BODYS
  static TextStyle get body1 => Get.context.textTheme.bodyText1;
  static TextStyle get body2 => Get.context.textTheme.bodyText2;
  static TextStyle get body3 => Get.context.textTheme.bodyText1.copyWith(fontSize: 13);
  static TextStyle get body4 => Get.context.textTheme.bodyText2.copyWith(fontSize: 13);
  //CAPTIONS
  static TextStyle get caption1 => Get.context.textTheme.caption;
  static TextStyle get caption2 => Get.context.textTheme.caption.copyWith(fontWeight: FontWeight.bold);
}

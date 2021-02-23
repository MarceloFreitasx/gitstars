import 'package:flutter/material.dart';

import 'appcolors.style.dart';

class AppTheme {
  static get themeData => ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColors.PRIMARY,
        accentColor: AppColors.GRAY4F,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        //Define the default appbar theme
        appBarTheme: AppBarTheme(shadowColor: AppColors.SHADOW),

        //Define the default card theme
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 10,
          shadowColor: AppColors.SHADOW,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.GRAYEC,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        scaffoldBackgroundColor: Colors.white,
        unselectedWidgetColor: AppColors.GRAYDA,
        toggleableActiveColor: AppColors.PRIMARY,

        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          headline2: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          subtitle1: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          subtitle2: TextStyle(fontSize: 19.0, color: AppColors.GRAY4F),
          bodyText1: TextStyle(fontSize: 15.0, color: AppColors.GRAY4F),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black87),
          caption: TextStyle(fontSize: 11.0, color: AppColors.GRAY4F, height: 1.1),
        ),
      );
}

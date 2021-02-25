import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  //Allow text input for:
  static get onlyLetters => new FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÊÍÏÓÔÕÖÚÇÑ ]"));
  static get onlyLettersAndNumbers =>
      new FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÊÍÏÓÔÕÖÚÇÑ ]"));

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';

// to get the responsive size
class R {
  // width
  static double sw(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 375);
  }

  // height
  static double sh(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 812);
  }
}

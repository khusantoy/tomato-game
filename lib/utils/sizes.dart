import 'package:flutter/material.dart';

class SizeUtils {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenFullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).viewPadding.top;
  }
}

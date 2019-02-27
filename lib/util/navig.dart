import 'package:flutter/material.dart';

class Navig {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");

    // Navigator.popAndPushNamed(context, "/home");
  }
}

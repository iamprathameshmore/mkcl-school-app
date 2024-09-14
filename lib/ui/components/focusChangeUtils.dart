import 'package:flutter/material.dart';

class Focuschangeutils {
  static void focuschange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}

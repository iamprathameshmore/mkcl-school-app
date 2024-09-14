import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class ToastMsg {
  static void flushbarErrorMsg(String Msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: Msg,
          duration: const Duration(seconds: 2),
        )..show(context));
  }
}

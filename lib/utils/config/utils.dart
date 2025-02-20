import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/res/app_color.dart';

class Utils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: AppColor.redColor,
        forwardAnimationCurve: Curves.linear,
        reverseAnimationCurve: Curves.decelerate,
        titleColor: AppColor.whiteColor,
        positionOffset: 20,
      )..show(context),
    );
  }

  static void flushBarSucessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: AppColor.greenColor,
        forwardAnimationCurve: Curves.linear,
        reverseAnimationCurve: Curves.decelerate,
        titleColor: AppColor.whiteColor,
        positionOffset: 20,
      )..show(context),
    );
  }
}

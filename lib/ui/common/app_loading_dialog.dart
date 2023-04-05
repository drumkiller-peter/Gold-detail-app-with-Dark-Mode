import 'package:flutter/material.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/ui/common/loading_indicator.dart';

class AppLoadingDialog {
  AppLoadingDialog._();
  static Future openLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.black.withOpacity(0.2),
          child: const LoadingIndicator(),
        );
      },
    );
  }
}

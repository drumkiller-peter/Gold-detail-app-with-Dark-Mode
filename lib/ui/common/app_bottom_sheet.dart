import 'package:flutter/material.dart';

class AppBottomSheet {
  AppBottomSheet._();
  static openBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return child;
      },
    );
  }
}

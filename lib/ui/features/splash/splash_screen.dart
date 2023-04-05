import 'package:flutter/material.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/ui/common/app_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.favorite,
              color: AppColor.primary,
            ),
            AppText("Remote Coach"),
          ],
        ),
      ),
    );
  }
}

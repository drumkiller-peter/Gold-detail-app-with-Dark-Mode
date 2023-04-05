import 'package:flutter/material.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/ui/common/app_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.onTap,
      this.svgColor,
      required this.title,
      required this.iconData});
  final String title;
  final IconData iconData;
  final GestureTapCallback onTap;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.secondaryTextColor),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            AppText(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

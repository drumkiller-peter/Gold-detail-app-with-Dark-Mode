import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/authentication/auth_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/ui/common/app_bottom_sheet.dart';
import 'package:remote_coach/ui/common/app_button.dart';
import 'package:remote_coach/ui/common/app_text.dart';
import 'package:remote_coach/ui/features/profile/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ProfileItem(
            onTap: () {
              AppBottomSheet.openBottomSheet(
                context,
                Wrap(
                  spacing: 1,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                        child: AppText("Are you sure you want to log out?")),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppPrimaryButton(
                          title: "Cancel",
                          onPressed: () {
                            getIt.get<NavigatorService>().navigator.pop();
                          },
                          isEnabled: true,
                        ),
                        AppPrimaryButton(
                          title: "Logout",
                          isEnabled: true,
                          color: AppColor.error,
                          onPressed: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(AuthenticationLogoutRequested());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              );
            },
            title: AppString.logOut,
            iconData: Icons.logout),
        ProfileItem(
          onTap: () {
            AppBottomSheet.openBottomSheet(
                context,
                Wrap(
                  children: [
                    ListTile(
                      onTap: () {
                        context.read<ThemeBloc>().add(ThemeChangeRequested(
                            appThemeMode: AppThemeMode.lightMode));
                      },
                      title: const AppText("Light Mode"),
                      trailing: const Icon(Icons.light_mode_outlined),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        context.read<ThemeBloc>().add(ThemeChangeRequested(
                            appThemeMode: AppThemeMode.darkMode));
                      },
                      title: const AppText("Dark Mode"),
                      trailing: const Icon(Icons.dark_mode_outlined),
                    ),
                  ],
                ));
          },
          title: AppString.switchTheme,
          iconData: Icons.light_mode,
        ),
      ],
    );
  }
}

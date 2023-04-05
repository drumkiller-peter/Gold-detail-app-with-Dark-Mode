import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/home/home_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/ui/features/dashboard/dashboard.dart';
import 'package:remote_coach/ui/features/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                final isDarkMode =
                    themeState.appThemeMode == AppThemeMode.darkMode;
                return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: isDarkMode
                        ? AppColor.bgFillColorDark
                        : AppColor.bgFillColorLight,
                    currentIndex: state.selectedIndex,
                    enableFeedback: true,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppColor.primary,
                    unselectedItemColor: AppColor.secondaryTextColor,
                    onTap: (value) {
                      context.read<HomeBloc>().add(
                            HomeBottomNavIconChangeRequested(
                              tappedBottomNavItemIndex: value,
                            ),
                          );
                    },
                    items: const [
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: Icon(Icons.home),
                      ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        icon: Icon(Icons.person_outline_sharp),
                      ),
                    ],
                  ),
                  body: PageView.builder(
                    controller: context.read<HomeBloc>().pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      if (index == AppBottomNavItemStatus.dashboard.index) {
                        return const DashboardScreen();
                      }
                      if (index == AppBottomNavItemStatus.profile.index) {
                        return const ProfileScreen();
                      }

                      return const DashboardScreen();
                    },
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}

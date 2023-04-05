import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/dashboard/dashboard_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/configs/app_extensions/date_extension.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/data/repository/dashboard_repository.dart';
import 'package:remote_coach/ui/common/app_text.dart';
import 'package:remote_coach/ui/common/loading_indicator.dart';
import 'package:remote_coach/ui/features/dashboard/no_internet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RepositoryProvider(
      create: (context) => DashboardRepository(),
      child: BlocProvider(
        create: (context) => DashboardBloc(context.read<DashboardRepository>())
          ..add(DashboardDataRequested()),
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                final isDarkMode = state.appThemeMode == AppThemeMode.darkMode;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    AppText(
                      AppString.goldDetails,
                      style: textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<DashboardBloc>().resetTimer();
                        context
                            .read<DashboardBloc>()
                            .add(DashboardDataRequested());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDarkMode
                              ? AppColor.bgFillColorDark
                              : AppColor.bgFillColorLight,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              AppString.tapToRefresh,
                              style: textTheme.bodyMedium,
                            ),
                            const Icon(Icons.refresh),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppText(
                      AppString.dataRefreshMessage,
                      style: textTheme.bodyMedium,
                    ),
                    BlocBuilder<DashboardBloc, DashboardState>(
                      buildWhen: (previous, current) =>
                          current is DashboardLoadInProgress ||
                          current is DashboardSuccess ||
                          current is DashboardFailure,
                      builder: (context, state) {
                        if (state is DashboardLoadInProgress) {
                          return const Expanded(child: LoadingIndicator());
                        } else if (state is DashboardFailure) {
                          return NoInternet(
                            errorMessage: state.message,
                          );
                        } else if (state is DashboardSuccess) {
                          return Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: state.goldDetailList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        tileColor: isDarkMode
                                            ? AppColor.bgFillColorDark
                                            : AppColor.bgFillColorLight,
                                        title: Row(
                                          children: [
                                            const AppText(
                                                "Value of Gold is : "),
                                            AppText(
                                              "\$${e.price} ",
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: isDarkMode
                                                          ? AppColor.warning
                                                          : AppColor.primary),
                                            )
                                          ],
                                        ),
                                        subtitle: AppText(
                                          e.timestamp.getFullDateTime(),
                                          style: textTheme.bodyMedium?.copyWith(
                                              color:
                                                  AppColor.secondaryTextColor),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()
                                  .reversed
                                  .toList(),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

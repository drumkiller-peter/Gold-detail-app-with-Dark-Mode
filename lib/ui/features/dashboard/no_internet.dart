// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/dashboard/dashboard_bloc.dart';
import 'package:remote_coach/ui/common/app_button.dart';
import 'package:remote_coach/ui/common/app_text.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: AppText(errorMessage),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        AppPrimaryButton(
          title: "Retry",
          width: 200,
          isEnabled: true,
          onPressed: () {
            context.read<DashboardBloc>().add(DashboardDataRequested());
          },
        )
      ],
    );
  }
}

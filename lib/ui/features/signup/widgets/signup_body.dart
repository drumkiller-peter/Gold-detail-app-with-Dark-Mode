import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:remote_coach/bloc/signup/signup_bloc.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/routes/app_routes.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/ui/common/app_button.dart';
import 'package:remote_coach/ui/common/app_loading_dialog.dart';
import 'package:remote_coach/ui/common/app_text.dart';
import 'package:remote_coach/ui/common/app_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpBloc>().signUpKey,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoadInProgress) {
            AppLoadingDialog.openLoadingDialog(context);
          } else if (state is SignUpSuccess) {
            getIt
                .get<NavigatorService>()
                .navigator
                .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
          } else if (state is SignUpFailure) {
            Navigator.pop(context);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            AppText(
              AppString.signUp,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            AppTextField(
              controller: context.read<SignUpBloc>().email,
              titleText: AppString.email,
              hint: AppString.emailHint,
              enabled: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: AppString.requiredField),
                FormBuilderValidators.email(
                  errorText: AppString.invalidEmail,
                ),
              ]),
              suffixIcon: const Icon(
                Icons.email_outlined,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppTextField(
              controller: context.read<SignUpBloc>().firstName,
              titleText: AppString.firstName,
              hint: AppString.nameHint,
              enabled: true,
              validator: FormBuilderValidators.minLength(
                3,
                errorText: AppString.atLeast3Char,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppTextField(
              controller: context.read<SignUpBloc>().lastName,
              titleText: AppString.lastName,
              hint: AppString.nameHint,
              enabled: true,
              validator: FormBuilderValidators.minLength(
                3,
                errorText: AppString.atLeast3Char,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppTextField(
              controller: context.read<SignUpBloc>().password,
              titleText: AppString.password,
              hint: AppString.passwordHint,
              enabled: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: AppString.requiredField,
                ),
                FormBuilderValidators.match(
                    r'^(?=.*[@#$%^&+=]|.*[A-Z])(?=.*[a-z])(?=.{8,}).*$',
                    errorText: AppString.passwordHint),
              ]),
              isPassword: true,
            ),
            const SizedBox(
              height: 40,
            ),
            AppPrimaryButton(
              title: AppString.signUp,
              isEnabled: true,
              onPressed: () {
                context.read<SignUpBloc>().add(SignUpRequested());
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(letterSpacing: 0.5),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppString.login,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            letterSpacing: 0.5,
                            color: AppColor.primary,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.login,
                            (_) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

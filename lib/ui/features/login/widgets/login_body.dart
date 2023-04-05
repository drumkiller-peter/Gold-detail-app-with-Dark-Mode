import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:remote_coach/bloc/login/login_bloc.dart';
import 'package:remote_coach/configs/dependency_injection/dependency_injection.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/configs/routes/app_routes.dart';
import 'package:remote_coach/configs/routes/navigator_service.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/constants/app_string.dart';
import 'package:remote_coach/ui/common/app_button.dart';
import 'package:remote_coach/ui/common/app_loading_dialog.dart';
import 'package:remote_coach/ui/common/app_snackbar.dart';
import 'package:remote_coach/ui/common/app_text.dart';
import 'package:remote_coach/ui/common/app_text_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Form(
        key: context.read<LoginBloc>().loginKey,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadInProgress) {
              AppLoadingDialog.openLoadingDialog(context);
            } else if (state is LoginSuccess) {
              getIt
                  .get<NavigatorService>()
                  .navigator
                  .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
            } else if (state is LoginFailure) {
              Navigator.pop(context);
              AppSnackBar.showSnackbar(
                  context, AppString.loginFailed, MessageType.error);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              AppText(
                AppString.login,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              AppTextField(
                controller: context.read<LoginBloc>().email,
                titleText: AppString.email,
                hint: AppString.emailHint,
                enabled: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(
                    errorText: AppString.invalidEmail,
                  ),
                  FormBuilderValidators.required(
                    errorText: AppString.requiredField,
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
                controller: context.read<LoginBloc>().password,
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
                title: AppString.login,
                isEnabled: true,
                onPressed: () {
                  context.read<LoginBloc>().add(LoginRequested());
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(letterSpacing: 0.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppString.signUp,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              letterSpacing: 0.5,
                              color: AppColor.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.signUp,
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
      ),
    );
  }
}

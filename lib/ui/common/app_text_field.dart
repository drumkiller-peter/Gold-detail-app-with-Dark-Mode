import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_coach/bloc/theme_bloc/theme_bloc.dart';
import 'package:remote_coach/configs/enum/app_enums.dart';
import 'package:remote_coach/constants/app_color.dart';
import 'package:remote_coach/ui/common/app_text.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? titleText;
  final String? hint;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final ValueChanged<String?>? onSaved;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final InputDecoration? inputDecoration;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? enabledInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool? filled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const AppTextField({
    Key? key,
    this.titleText,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.isPassword = false,
    this.hint,
    this.borderRadius,
    this.enabled,
    this.maxLines = 1,
    this.maxLength,
    this.maxLengthEnforcement,
    this.inputDecoration,
    this.label,
    this.contentPadding,
    this.suffixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.inputBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.labelStyle,
    this.hintStyle,
    this.controller,
    this.enabledInputBorder,
    this.inputTextStyle,
    this.inputFormatter,
    this.textInputAction,
    this.onFieldSubmitted,
    this.filled,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  FormFieldValidator<String>? validator;

  void onPasswordVisibilityToggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.appThemeMode == AppThemeMode.darkMode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.titleText != null) ...[
              AppText(
                widget.titleText!,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
            ],
            TextFormField(
              validator: widget.validator,
              obscureText: widget.isPassword ? !obscureText : false,
              onSaved: widget.onSaved,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              initialValue: widget.initialValue,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              maxLengthEnforcement: widget.maxLengthEnforcement,
              cursorColor: AppColor.primary,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              autovalidateMode:
                  widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
              style: widget.inputTextStyle ?? textTheme.bodyMedium,
              decoration: widget.inputDecoration ??
                  InputDecoration(
                    errorStyle: textTheme.bodyMedium?.copyWith(
                        fontSize: 10,
                        color: AppColor.error.withOpacity(0.7),
                        fontStyle: FontStyle.italic),
                    counterText: "",
                    filled: widget.filled ?? true,
                    fillColor: isDarkMode
                        ? AppColor.bgFillColorDark
                        : AppColor.bgFillColorLight,
                    label: widget.label != null
                        ? AppText(
                            widget.label ?? "",
                          )
                        : null,
                    labelStyle: widget.labelStyle ??
                        textTheme.bodyMedium?.copyWith(
                          color: AppColor.black,
                        ),
                    hintText: widget.hint,
                    hintStyle: widget.hintStyle ??
                        textTheme.bodySmall?.copyWith(
                          color: AppColor.secondaryTextColor,
                          fontSize: 10,
                        ),
                    contentPadding: widget.contentPadding ??
                        const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: null,
                    border: null,
                    focusedBorder: widget.focusedBorder ??
                        OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 1,
                            color: AppColor.primary,
                          ),
                        ),
                    focusedErrorBorder: widget.focusedErrorBorder ??
                        OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColor.error.withOpacity(0.7),
                          ),
                        ),
                    errorBorder: OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.error.withOpacity(0.7),
                      ),
                    ),
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: onPasswordVisibilityToggle,
                            child: Icon(
                              !obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColor.primary,
                              size: 20,
                            ),
                          )
                        : widget.suffixIcon,
                  ),
              inputFormatters: widget.inputFormatter,
            ),
          ],
        );
      },
    );
  }
}

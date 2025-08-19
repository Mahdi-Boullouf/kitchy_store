import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/app_typography.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function()? onSuffixWidgetTapped;
  final int? maxLength;
  final bool disabled;
  final Function(String)? onChanged;

  const InputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    this.errorText,
    required this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.suffixWidget,
    this.prefixWidget,
    this.onSuffixWidgetTapped,
    this.maxLength,
    this.disabled = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.px12 / 2,
      children: [
        CustomText.smallParagraphMedium(
          labelText,
          color: AppColors.textKre,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppSpacing.px4,
          children: [
            if (prefixWidget != null) prefixWidget!,
            Expanded(
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                maxLength: maxLength,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "هذه الخانة ضرورية";
                  }
                  return null;
                },
                onChanged: onChanged,
                enabled: !disabled,
                style: AppTypography.smallParagraphMedium.copyWith(
                  color: AppColors.mainKre,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTypography.smallParagraphMedium.copyWith(
                    color: AppColors.placeholderKre,
                  ),
                  errorText: errorText,
                  errorStyle: AppTypography.labelRegular.copyWith(
                    color: AppColors.redKre,
                  ),
                  suffixIcon: suffixWidget != null
                      ? GestureDetector(
                          onTap: onSuffixWidgetTapped,
                          child: suffixWidget,
                        )
                      : null,
                  filled: true,
                  fillColor:
                      disabled ? AppColors.disabledFillKre : AppColors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px16,
                    vertical: AppSpacing.px12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.redKre,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.redKre,
                      width: 1.2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  counterText: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

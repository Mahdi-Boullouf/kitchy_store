import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/app_typography.dart';
import 'package:kitchy_store/ui/common/widgets/custom_icon.dart';

enum CustomButtonVariant {
  filled,
  outlined,
  plain,
}

enum CustomButtonSize {
  large, // 48px
  medium, // 44px
  small, // 40px
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? outlineColor;
  final String? icon;
  final bool isDisabled;
  final bool expandToFullWidth;
  final CustomButtonSize size;

  const CustomButton.filled({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.isDisabled = false,
    this.expandToFullWidth = true,
    this.size = CustomButtonSize.medium,
  })  : outlineColor = null,
        variant = CustomButtonVariant.filled;

  const CustomButton.outlined({
    super.key,
    required this.text,
    this.onPressed,
    this.foregroundColor,
    this.outlineColor,
    this.icon,
    this.isDisabled = false,
    this.expandToFullWidth = true,
    this.size = CustomButtonSize.medium,
  })  : backgroundColor = null,
        variant = CustomButtonVariant.outlined;

  const CustomButton.plain({
    super.key,
    required this.text,
    this.onPressed,
    this.foregroundColor,
    this.icon,
    this.isDisabled = false,
    this.expandToFullWidth = false,
    this.size = CustomButtonSize.medium,
  })  : backgroundColor = null,
        outlineColor = null,
        variant = CustomButtonVariant.plain;

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || onPressed == null;
    return _buildButton(disabled);
  }

  double _getButtonHeight() {
    switch (size) {
      case CustomButtonSize.large:
        return 12 * AppSpacing.px4; // 48px
      case CustomButtonSize.medium:
        return 11 * AppSpacing.px4; // 44px
      case CustomButtonSize.small:
        return 10 * AppSpacing.px4; // 40px
    }
  }

  Widget _buildButton(bool disabled) {
    switch (variant) {
      case CustomButtonVariant.filled:
        return _buildFilledButton(disabled);
      case CustomButtonVariant.outlined:
        return _buildOutlinedButton(disabled);
      case CustomButtonVariant.plain:
        return _buildPlainButton(disabled);
    }
  }

  Widget _buildFilledButton(bool disabled) {
    final Color buttonBackgroundColor = backgroundColor ?? AppColors.primary;
    final Color buttonForegroundColor = foregroundColor ?? AppColors.white;

    return FilledButton(
      onPressed: disabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor:
            disabled ? AppColors.disabledKre : buttonBackgroundColor,
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledBackgroundColor: AppColors.disabledKre,
        disabledForegroundColor: AppColors.textKre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.px12),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildOutlinedButton(bool disabled) {
    final Color buttonForegroundColor = foregroundColor ?? AppColors.mainKre;
    final Color buttonOutlineColor = outlineColor ?? AppColors.strokeKre;

    return OutlinedButton(
      onPressed: disabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledForegroundColor: AppColors.textKre,
        side: BorderSide(
          color: disabled ? AppColors.strokeKre : buttonOutlineColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.px12),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24,
        ),
        fixedSize: expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildPlainButton(bool disabled) {
    final Color buttonForegroundColor = foregroundColor ?? AppColors.greenKre;

    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledForegroundColor: AppColors.textKre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.px12),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24,
        ),
        fixedSize: expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildButtonContent(Color forGroundColor) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.px8,
        children: [
          CustomIcon(
            iconPath: icon!,
            size: AppSpacing.px20,
            color: forGroundColor,
          ),
          Text(
            text,
            style: AppTypography.smallParagraphBold.copyWith(
              color: forGroundColor,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: AppTypography.smallParagraphBold.copyWith(
        color: forGroundColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_typography.dart';

enum CustomTextStyle {
  none,
  largeTitle,
  title,
  paragraph,
  smallParagraphMedium,
  smallParagraphBold,
  labelMedium,
  labelRegular,
}

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextStyle style;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final Color? textDecorationColor;
  final TextAlign? textAlign;
  final int? maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.style = CustomTextStyle.none,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  });

  const CustomText.largeTitle(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.largeTitle;

  const CustomText.title(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.title;

  const CustomText.paragraph(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.paragraph;

  const CustomText.smallParagraphMedium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.smallParagraphMedium;

  const CustomText.smallParagraphBold(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.smallParagraphBold;

  const CustomText.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.labelMedium;

  const CustomText.labelRegular(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationColor,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : style = CustomTextStyle.labelRegular;

  TextStyle _getTextStyle() {
    switch (style) {
      case CustomTextStyle.none:
        return AppTypography.paragraph;
      case CustomTextStyle.largeTitle:
        return AppTypography.largeTitle;
      case CustomTextStyle.title:
        return AppTypography.title;
      case CustomTextStyle.paragraph:
        return AppTypography.paragraph;
      case CustomTextStyle.smallParagraphMedium:
        return AppTypography.smallParagraphMedium;
      case CustomTextStyle.smallParagraphBold:
        return AppTypography.smallParagraphBold;
      case CustomTextStyle.labelMedium:
        return AppTypography.labelMedium;
      case CustomTextStyle.labelRegular:
        return AppTypography.labelRegular;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: _getTextStyle().copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        decoration: textDecoration,
        decorationStyle: textDecorationStyle,
        decorationColor: textDecorationColor,
      ),
    );
  }
}

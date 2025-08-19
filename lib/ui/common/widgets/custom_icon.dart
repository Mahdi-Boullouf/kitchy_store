import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color? color;
  final BoxFit fit;

  const CustomIcon({
    super.key,
    required this.iconPath,
    this.size = 24,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: size,
      height: size,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
      placeholderBuilder: (context) => Icon(
        Icons.error_outline,
        size: size,
        color: AppColors.redKre,
      ),
    );
  }
}

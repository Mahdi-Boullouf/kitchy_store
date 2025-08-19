import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:kitchy_store/ui/common/widgets/gap.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [CustomText.smallParagraphBold(title)]),
        const Divider(
          thickness: 0.2,
        ),
      ],
    );
  }
}

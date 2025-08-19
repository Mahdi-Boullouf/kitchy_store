import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'full_screen_image_viewmodel.dart';

class FullScreenImageView extends StackedView<FullScreenImageViewModel> {
  const FullScreenImageView(this.image, {Key? key}) : super(key: key);
  final String image;
  @override
  Widget builder(
    BuildContext context,
    FullScreenImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.px8, vertical: AppSpacing.px16),
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover)),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {
                  locator<RouterService>().back();
                },
                icon: const Icon(Icons.close)),
          ),
        ),
      ),
    );
  }

  @override
  FullScreenImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FullScreenImageViewModel();
}

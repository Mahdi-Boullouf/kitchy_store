import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(child: CustomText.title("HELLO TO KITCHY STORE")),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

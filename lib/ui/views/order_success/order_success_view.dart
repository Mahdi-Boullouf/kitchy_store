import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:kitchy_store/ui/common/widgets/gap.dart';
import 'package:stacked/stacked.dart';

import 'order_success_viewmodel.dart';

class OrderSuccessView extends StackedView<OrderSuccessViewModel> {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderSuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 42,
                ),
              ),
              SizedBox(height: AppSpacing.px24),
              const CustomText.smallParagraphBold("تم الطلب بنجاح"),
              const CustomText.labelRegular("سيتم التواصل معك في أقرب وقت"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OrderSuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderSuccessViewModel();
}

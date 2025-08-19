import 'package:flutter/material.dart';
import 'package:kitchy_store/models/product_model.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/app_typography.dart';
import 'package:kitchy_store/ui/common/widgets/app_bar.dart';
import 'package:kitchy_store/ui/common/widgets/custom_button.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:kitchy_store/ui/common/widgets/input_field.dart';
import 'package:kitchy_store/ui/common/wilayas.dart';
import 'package:stacked/stacked.dart';

import 'order_product_viewmodel.dart';
import '../../common/wilayas.dart';

class OrderProductView extends StackedView<OrderProductViewModel> {
  const OrderProductView(
      {required this.quantity,
      required this.product,
      required this.colorId,
      Key? key})
      : super(key: key);
  final int quantity;
  final int colorId;
  final ProductModel product;
  @override
  Widget builder(
    BuildContext context,
    OrderProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.px24, vertical: AppSpacing.px16),
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          )
        ]),
        child: CustomButton.filled(
            text: "إرسال الطلب",
            onPressed: () {
              viewModel.placeOrder(product.id, quantity, colorId);
            }),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
          child: Form(
            key: viewModel.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(title: "اطلب المنتج"),
                SizedBox(height: AppSpacing.px24),
                const Row(
                  children: [
                    CustomText.smallParagraphBold("المنتج المحدد"),
                  ],
                ),
                SizedBox(height: AppSpacing.px12),
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.px8),
                    child: Image.network(
                      "http://127.0.0.1:8000${product.images.first.path}",
                      height: AppSpacing.px1 * 40,
                      width: AppSpacing.px1 * 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: AppSpacing.px8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.labelMedium(
                        product.name,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText.labelRegular(
                          "${product.price * quantity} DZD"),
                      // CustomText.labelRegular(
                      //     " لقد وفرت بطلبك ل$quantity قطع ${((quantity - 1) * 250)} DZD")
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  CircleAvatar(
                      backgroundColor: AppColors.textKre.withValues(alpha: .2),
                      child: CustomText.labelMedium("x$quantity"))
                ]),
                SizedBox(height: AppSpacing.px24),
                const CustomText.smallParagraphBold("معلومات الطلب"),
                SizedBox(height: AppSpacing.px12),
                InputField(
                    controller: viewModel.fullNameController,
                    focusNode: FocusNode(),
                    labelText: "الاسم واللقب",
                    hintText: "أدخل الاسم واللقب",
                    keyboardType: TextInputType.text),
                SizedBox(height: AppSpacing.px12),
                InputField(
                    controller: viewModel.mobileNumberController,
                    focusNode: FocusNode(),
                    labelText: "رقم الهاتف",
                    hintText: "أدخل الاسم واللقب",
                    keyboardType: TextInputType.text),
                SizedBox(height: AppSpacing.px12),
                const CustomText.smallParagraphMedium(
                  "الولاية",
                  color: AppColors.textKre,
                ),
                DropdownMenu(
                    initialSelection: viewModel.selectedWilaya,
                    width: double.infinity,
                    textStyle: AppTypography.smallParagraphMedium.copyWith(
                      color: AppColors.mainKre,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      filled: false,
                      isDense: true,
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
                    ),
                    dropdownMenuEntries: List.generate(
                        wilays.length,
                        (i) => DropdownMenuEntry(
                              value: wilays[i]['ar_name'],
                              label:
                                  ("${wilays[i]['id']!} - ${wilays[i]['ar_name']!}"),
                            )),
                    onSelected: (d) {
                      viewModel.selectedWilaya = d!;
                      viewModel.rebuildUi();
                    }),
                SizedBox(height: AppSpacing.px12),
                InputField(
                    controller: viewModel.communController,
                    focusNode: FocusNode(),
                    labelText: "البلدية",
                    hintText: "أدخل البلدية",
                    keyboardType: TextInputType.text),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  OrderProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderProductViewModel();
}

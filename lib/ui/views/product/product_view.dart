import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/app/app.router.dart';
import 'package:kitchy_store/models/order_model.dart';
import 'package:kitchy_store/ui/common/api_constants.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:kitchy_store/ui/common/widgets/app_bar.dart';
import 'package:kitchy_store/ui/common/widgets/custom_button.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    ResponsiveSizer.init(context);

    return Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar:
            viewModel.isBusy ? const SizedBox() : const BottomBarActions(),
        body: SafeArea(
          top: true,
          child: viewModel.isThereAnError
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Some error happend")],
                  ),
                )
              : viewModel.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.px24),
                            child: const CustomAppBar(
                              title: "LA PACK",
                            ),
                          ),
                          SizedBox(height: AppSpacing.px24),
                          SizedBox(
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: AppSpacing.px24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: AppSpacing.px1 * 320,
                                  child: PageView.builder(
                                    onPageChanged: (value) {
                                      viewModel.selectedPage = value;
                                      viewModel.rebuildUi();
                                    },
                                    itemBuilder: (c, i) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSpacing.px24),
                                      child: InkWell(
                                        onTap: () {
                                          locator<RouterService>()
                                              .navigateToFullScreenImageView(
                                                  image:
                                                      "http://127.0.0.1:8000${viewModel.productModel!.images[i].path}");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppSpacing.px8),
                                          child: Image.network(
                                            "http://127.0.0.1:8000${viewModel.productModel!.images[i].path}",
                                            height: AppSpacing.px1 * 320,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemCount:
                                        viewModel.productModel!.images.length,
                                  ),
                                ),
                                SizedBox(height: AppSpacing.px24),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSpacing.px24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: List.generate(
                                              viewModel
                                                  .productModel!.images.length,
                                              (i) => CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor: i ==
                                                            viewModel
                                                                .selectedPage
                                                        ? Colors.black
                                                        : AppColors.textKre,
                                                  ))),
                                      SizedBox(height: AppSpacing.px24),
                                      const CustomDivider(),
                                      SizedBox(height: AppSpacing.px24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText.smallParagraphBold(
                                              viewModel.productModel!.name),
                                          CustomText.labelRegular(
                                              "${viewModel.productModel!.price} DZD")
                                        ],
                                      ),
                                      SizedBox(height: AppSpacing.px12),
                                      CustomText.labelMedium(
                                        viewModel.productModel!.description,
                                        maxLines: 8,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(height: AppSpacing.px24),
                                      const CustomDivider(),
                                      SizedBox(height: AppSpacing.px24),
                                      const Row(
                                        children: [
                                          CustomText.smallParagraphBold(
                                              "Colors")
                                        ],
                                      ),
                                      SizedBox(height: AppSpacing.px12),
                                      Row(
                                          spacing: AppSpacing.px8,
                                          children: List.generate(
                                              viewModel
                                                  .productModel!.colors.length,
                                              (i) => Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.fromBorderSide(BorderSide(
                                                            color: viewModel
                                                                        .color ==
                                                                    viewModel
                                                                        .productModel!
                                                                        .colors[i]
                                                                ? Colors.black
                                                                : Colors.transparent))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: InkWell(
                                                        onTap: () {
                                                          viewModel.selectColor(
                                                              viewModel
                                                                  .productModel!
                                                                  .colors[i]);
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 16,
                                                          backgroundColor: Color(
                                                              int.parse(viewModel
                                                                  .productModel!
                                                                  .colors[i]
                                                                  .hex
                                                                  .replaceAll(
                                                                      "#",
                                                                      "0xFF"))),
                                                        ),
                                                      ),
                                                    ),
                                                  ))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
        ));
  }

  @override
  void onViewModelReady(ProductViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.initilise();
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();
}

class BottomBarActions extends ViewModelWidget<ProductViewModel> {
  const BottomBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .08),
          blurRadius: 1,
          spreadRadius: 0,
          offset: const Offset(0, 0),
        )
      ]),
      padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24, vertical: AppSpacing.px16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      viewModel.decreaseQuantity();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.textKre.withValues(alpha: .3),
                            borderRadius: BorderRadius.circular(2)),
                        padding: EdgeInsets.all(AppSpacing.px16),
                        child: const Icon(
                          Icons.remove,
                          size: 10,
                        )),
                  ),
                  SizedBox(width: AppSpacing.px12),
                  CustomText.labelRegular(viewModel.quantity.toString()),
                  SizedBox(width: AppSpacing.px12),
                  InkWell(
                    onTap: () {
                      viewModel.increaseQuantity();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.textKre.withValues(alpha: .3),
                            borderRadius: BorderRadius.circular(2)),
                        padding: EdgeInsets.all(AppSpacing.px16),
                        child: const Icon(
                          Icons.add,
                          size: 10,
                        )),
                  )
                ],
              ),
              SizedBox(width: AppSpacing.px32),
              Expanded(
                child: CustomButton.filled(
                    text: "شراء الأن",
                    onPressed: () {
                      locator<RouterService>().replaceWithOrderProductView(
                          quantity: viewModel.quantity,
                          product: viewModel.productModel!,
                          colorId: viewModel.color!.id);
                    }),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.px8),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black.withValues(alpha: .1),
    );
  }
}

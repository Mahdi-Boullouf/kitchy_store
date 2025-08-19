import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:kitchy_store/ui/common/widgets/app_bar.dart';
import 'package:kitchy_store/ui/common/widgets/custom_button.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchy_store/ui/common/widgets/input_field.dart';
import 'add_product_viewmodel.dart';

class AddProductView extends StackedView<AddProductViewModel> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    AddProductViewModel viewModel,
    Widget? child,
  ) {
    ResponsiveSizer.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomAppBar(title: "اضافة منتج"),
              InputField(
                controller: viewModel.nameController,
                focusNode: viewModel.nameFocus,
                labelText: 'اسم المنتج',
                hintText: '',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              InputField(
                controller: viewModel.descriptionController,
                focusNode: viewModel.descriptionFocus,
                labelText: 'الوصف',
                hintText: '',
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 12),
              InputField(
                controller: viewModel.priceController,
                focusNode: viewModel.priceFocus,
                labelText: 'السعر للزبون',
                hintText: '',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              InputField(
                controller: viewModel.netPriceController,
                focusNode: viewModel.netPriceFocus,
                labelText: 'السعر الصافي',
                hintText: '',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const CustomText.smallParagraphBold(
                'الألوان',
              ),
              const SizedBox(height: 8),
              // Display selected colors as chips
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: viewModel.availableColors
                    .map((color) => Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1.5,
                                color:
                                    viewModel.selectedColors.contains(color.id)
                                        ? Colors.black
                                        : Colors.transparent),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.toggleColor(color);
                            },
                            child: CircleAvatar(
                              radius: 20.5,
                              backgroundColor: Colors.black12,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(int.parse(
                                    color.hex.replaceAll("#", "0xff"))),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              // Uncomment below if you want to use a color picker dialog
              //   spacing: 8,
              //   children: viewModel.selectedColors
              //       .map((color) => Chip(
              //             backgroundColor: color,
              //             label: const SizedBox.shrink(),
              //             deleteIcon: const Icon(Icons.close),
              //             onDeleted: () => viewModel.removeColor(color),
              //           ))
              //       .toList(),
              // ),
              TextButton(
                onPressed: viewModel.pickColor,
                child: const Text('اضافة لون'),
              ),
              const SizedBox(height: 12),
              const CustomText.smallParagraphBold(
                'الصور',
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: viewModel.images
                    .map((file) => Stack(
                          children: [
                            Image.file(file,
                                width: 80, height: 80, fit: BoxFit.cover),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => viewModel.removeImage(file),
                                child:
                                    const Icon(Icons.close, color: Colors.red),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
              TextButton(
                onPressed: viewModel.pickImages,
                child: const Text('اضافة صور'),
              ),
              const SizedBox(height: 24),
              viewModel.isBusy
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : CustomButton.filled(
                      text: "حفظ المنتج",
                      onPressed: viewModel.addProduct,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddProductViewModel viewModelBuilder(BuildContext context) =>
      AddProductViewModel();
  @override
  void onViewModelReady(AddProductViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.initialise();
  }
}

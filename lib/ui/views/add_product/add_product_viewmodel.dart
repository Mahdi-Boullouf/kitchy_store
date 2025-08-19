import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/models/product_model.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitchy_store/services/products_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AddProductViewModel extends BaseViewModel {
  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController netPriceController = TextEditingController();

  // Focus nodes
  final FocusNode nameFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();
  final FocusNode netPriceFocus = FocusNode();
  List<ColorModel> availableColors = []; // Store available colors from API
  // Colors & Images
  List<int> selectedColors = [];
  List<File> images = [];
  final List<String> imagesUrls = []; // Store uploaded image URLs
  final ImagePicker _picker = ImagePicker();

  // Pick a single color
  void pickColor() {
    // // Ensure this is defined at the top-level of your app, e.g. in main.dart
    // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    // Color pickedColor = Colors.blue;
    // showDialog(
    //   context: navigatorKey.currentContext!,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Pick a color'),
    //     content: SingleChildScrollView(
    //       child: ColorPicker(
    //         pickerColor: pickedColor,
    //         onColorChanged: (color) => pickedColor = color,
    //       ),
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //           selectedColors.add(pickedColor);
    //           notifyListeners();
    //         },
    //         child: const Text('Select'),
    //       ),
    //     ],
    //   ),
    // );
  }

  void removeColor(Color color) {
    selectedColors.remove(color);
    notifyListeners();
  }

  // Pick multiple images
  Future<void> pickImages() async {
    final List<XFile> picked = await _picker.pickMultiImage();
    images.addAll(picked.map((xfile) => File(xfile.path)));
    notifyListeners();
  }

  void removeImage(File file) {
    images.remove(file);
    notifyListeners();
  }

  Future<void> uploadImages() async {
    // This method should handle uploading images to your server
    // and returning the URLs or paths for the images.
    // You can use ProductsService().uploadImage(file) for each image.
    for (var image in images) {
      final response = await ProductsService().uploadImage(image);
      if (response.success) {
        // Handle success, e.g., store the returned URL
        imagesUrls.add(response.data['url']);
      } else {
        // Handle error
        print('Image upload failed: ${response.message}');
      }
    }
  }

  getColors() async {
    final response = await ProductsService().getColors();
    if (response.success) {
      availableColors.addAll(response.data!);
      notifyListeners();
    } else {
      // Handle error
      print('Failed to fetch colors: ${response.message}');
    }
  }

  Future<void> addProduct() async {
    setBusy(true);

    // Map colors to just IDs
    await uploadImages();
    // Map images to Laravel expected structure
    List<Map<String, dynamic>> imageMaps = imagesUrls
        .asMap()
        .entries
        .map((entry) => {
              'path': entry.value, // This should be the uploaded URL
              'is_primary': entry.key == 0, // first image primary
              'sort_order': entry.key,
            })
        .toList();

    // Build body
    Map<String, dynamic> body = {
      'name': nameController.text,
      'description': descriptionController.text,
      'stock': 0,
      'price': int.tryParse(priceController.text) ?? 0,
      'net_price': int.tryParse(netPriceController.text) ?? 0,
      'active': true,
      'colors': selectedColors,
      'images': imageMaps,
    };
    log(body.toString());

    final response = await ProductsService().createProduct(body);

    if (response.success) {
      // success actions
      await locator<BottomSheetService>().showBottomSheet(title: "تم الاضافة");
      locator<NavigationService>().back();
    } else {
      // error actions
    }

    setBusy(false);
  }

  toggleColor(ColorModel c) {
    if (selectedColors.contains(c.id)) {
      selectedColors.remove(c.id);
    } else {
      selectedColors.add(c.id);
    }

    notifyListeners();
  }

  initialise() {
    getColors();
  }
}

// You need a global navigatorKey for dialogs

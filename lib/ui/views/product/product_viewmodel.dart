import 'dart:developer';

import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/models/product_model.dart';
import 'package:kitchy_store/services/products_service.dart';
import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  @override
  bool isThereAnError = false;
  int selectedPage = 0;
  int quantity = 1;
  ColorModel? color;

  ProductModel? productModel;
  final productService = locator<ProductsService>();
  increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  decreaseQuantity() {
    if (quantity == 1) return;
    quantity--;
    notifyListeners();
  }

  initilise() async {
    setBusy(true);
    final baseUri = Uri.base;
    final fragment = baseUri.fragment;
    final fragmentUri = Uri.parse(fragment);

    final id = fragmentUri.queryParameters['id'];
    // if (id == null || int.tryParse(id) == null) {
    //   isThereAnError = true;
    //   notifyListeners();
    //   return;
    // }
    try {
      final response = await productService.getProduct(int.parse(9.toString()));
      productModel = response.data;
      log(productModel!.id.toString());
      color = productModel!.colors[0];
    } catch (e) {
      // rethrow;

      isThereAnError = true;
    }
    notifyListeners();
    setBusy(false);
  }

  selectColor(ColorModel colorM) {
    color = colorM;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/app/app.router.dart';
import 'package:kitchy_store/services/orders_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderProductViewModel extends BaseViewModel {
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final wilayaController = TextEditingController();
  final communController = TextEditingController();
  final orderService = locator<OrdersService>();
  final key = GlobalKey<FormState>();
  String selectedWilaya = 'الجزائر';
  placeOrder(int id, int quantity, int colorId) async {
    try {
      if (!key.currentState!.validate()) {
        return;
      }
      final body = {
        "full_name": fullNameController.text,
        "mobile_number": mobileNumberController.text,
        "wilaya": selectedWilaya,
        "commune": communController.text,
        "exact_address": "no_address",
        "items": [
          {"product_id": id, "quantity": quantity, "color_id": colorId}
        ]
      };
      final response = await orderService.createOrder(body);
      if (response.success) {
        locator<RouterService>().replaceWithOrderSuccessView();
      } else {
        print(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}

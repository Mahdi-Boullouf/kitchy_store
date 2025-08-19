import 'dart:developer';

import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/models/order.dart';
import 'package:kitchy_store/models/order_model.dart';
import 'package:kitchy_store/services/orders_service.dart';
import 'package:stacked/stacked.dart';

class OrdersViewModel extends BaseViewModel {
  final ordersService = locator<OrdersService>();
  final List<Order> orders = [];
  String? status;
  setFilter(String value) {
    orders.clear();
    status = value;
    getOrders();
  }

  getOrders() async {
    final response = await ordersService.getOrders(status: status);
    log(response.data!.length.toString());
    final data = response.data!.map((e) => Order.fromJson(e));
    orders.addAll(data);
    notifyListeners();
  }

  updateOrderStatus(int id, String status) async {
    log("GGG");
    final response = await ordersService
        .updateOrder(id, {"status": status, 'hidden': false});
    print(response.data);
    if (response.success) {
      orders.clear();
      getOrders();
    }
  }
}

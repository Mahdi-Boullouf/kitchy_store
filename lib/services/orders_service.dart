// lib/services/orders_service.dart

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kitchy_store/models/api_response.dart';
import 'package:kitchy_store/ui/common/api_constants.dart';

class OrdersService {
  final Dio _dio;

  OrdersService({Dio? dio}) : _dio = dio ?? Dio();

  // Get all orders
  Future<ApiResponseModel<List<dynamic>>> getOrders({String? status}) async {
    try {
      final res = await _dio.get(ApiConstants.orders,
          queryParameters: status == null ? null : {'status': status});
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as List<dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Get single order
  Future<ApiResponseModel<Map<String, dynamic>>> getOrder(int id) async {
    try {
      final res = await _dio.get(ApiConstants.order(id));
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Create order
  Future<ApiResponseModel<Map<String, dynamic>>> createOrder(
      Map<String, dynamic> body) async {
    try {
      log(body.toString());

      final res = await _dio.post(ApiConstants.orders, data: body);
      print(res.data);
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Update order
  Future<ApiResponseModel<Map<String, dynamic>>> updateOrder(
      int id, Map<String, dynamic> body) async {
    try {
      final res = await _dio.put(ApiConstants.order(id), data: body);
      print(res.data);
      final response =
          ApiResponseModel<Map<String, dynamic>>(success: true, data: res.data);
      return response;
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Delete order
  Future<ApiResponseModel<bool>> deleteOrder(int id) async {
    try {
      final res = await _dio.delete(ApiConstants.order(id));
      return ApiResponseModel.fromJson(
        res.data,
        (data) => true,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }
}

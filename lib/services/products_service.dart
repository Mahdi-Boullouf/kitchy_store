// lib/services/products_service.dart

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kitchy_store/models/api_response.dart';
import 'package:kitchy_store/ui/common/api_constants.dart';
import 'package:kitchy_store/models/product_model.dart';

class ProductsService {
  final Dio _dio;

  ProductsService({Dio? dio}) : _dio = dio ?? Dio();

  // Get all products
  Future<ApiResponseModel<List<dynamic>>> getProducts() async {
    try {
      final res = await _dio.get(ApiConstants.products);
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as List<dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Get single product
  Future<ApiResponseModel<ProductModel>> getProduct(int id) async {
    try {
      final res = await _dio.get(ApiConstants.product(id));
      print("getting product");
      return ApiResponseModel(
        success: true,
        data: ProductModel.fromJson(res.data['data']),
      );
    } catch (e) {
      rethrow;
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  Future<ApiResponseModel<List<ColorModel>>> getColors() async {
    try {
      final res = await _dio.get(ApiConstants.colors);
      final apiResponse = ApiResponseModel(
          success: true,
          data: (res.data['data'] as List)
              .map((e) => ColorModel.fromJson(e))
              .toList());

      return apiResponse;
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Create product
  Future<ApiResponseModel<Map<String, dynamic>>> createProduct(
      Map<String, dynamic> body) async {
    try {
      final res =
          await _dio.post(ApiConstants.products, data: jsonEncode(body));
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Update product
  Future<ApiResponseModel<Map<String, dynamic>>> updateProduct(
      int id, Map<String, dynamic> body) async {
    try {
      final res = await _dio.put(ApiConstants.product(id), data: body);
      return ApiResponseModel.fromJson(
        res.data,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Upload image
  Future<ApiResponseModel> uploadImage(File image) async {
    try {
      String fileName = image.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        "${ApiConstants.baseUrl}/products/upload-image",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      return ApiResponseModel(success: true, data: response.data);
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }

  // Delete product
  Future<ApiResponseModel<bool>> deleteProduct(int id) async {
    try {
      final res = await _dio.delete(ApiConstants.product(id));
      return ApiResponseModel.fromJson(
        res.data,
        (data) => true,
      );
    } catch (e) {
      return ApiResponseModel(success: false, message: e.toString());
    }
  }
}

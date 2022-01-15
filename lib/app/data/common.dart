import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';

showSnackBar({String? title, String? message}) {
  Get.snackbar(
    title ?? '',
    message ?? '',
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(20),
  );
}

const String testUrl = "https://api-vms.herokuapp.com";
const String apiUrl = testUrl;

Dio dioClient = Dio();

class DioRetryInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      RequestOptions? options = err.requestOptions;
      final authController = Get.find<AuthController>();
      authController.refreshAuthToken();
      final String? newToken = await authController.getAuthToken();
      options.headers["Authorization"] = 'Bearer: $newToken';
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authController = Get.find<AuthController>();
    authController.refreshAuthToken();
    final String? authToken = await authController.getAuthToken();
    options.headers['Authorization'] = 'Bearer: $authToken';
    super.onRequest(options, handler);
  }
}

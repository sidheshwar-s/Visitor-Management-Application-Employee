import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/modules/home/models/home_page_model.dart';

class HomeProviders {
  static Dio dio = dioClient;

  Future<HomePageModel?> getHomePageDetails() async {
    try {
      const url = '$apiUrl/employee/getHomePage';
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        HomePageModel homePageModel = HomePageModel.fromMap(response.data);
        return homePageModel;
      }
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }
}

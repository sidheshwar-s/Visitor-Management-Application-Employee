import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/models/dashboard_model.dart';

class DashboardProviders {
  Future<DashBoardModel?> getDashbaordDetails() async {
    const url = "$apiUrl/employee/getDashboard";
    try {
      Response response = await dioClient.get(url);
      DashBoardModel dashBoardModel = DashBoardModel.fromMap(response.data);
      return dashBoardModel;
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }
}

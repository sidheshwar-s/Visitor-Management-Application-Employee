import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/models/visitor_info_model.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/models/visitor_log_model.dart';

class VisitorLogProviders {
  Future<VisitorLogModel?> getVisitorsList() async {
    const url = "$apiUrl/employee/getVisitors";
    try {
      Response response = await dioClient.get(url);
      VisitorLogModel visitorLogModel = VisitorLogModel.fromMap(response.data);
      return visitorLogModel;
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }

  Future<VisitorInfoModel?> getVisitorInfo({required String visitorId}) async {
    final url = "$apiUrl/employee/getVisitorData?visitorId=$visitorId";

    try {
      Response response = await dioClient.get(url);
      VisitorInfoModel visitorInfoModel =
          VisitorInfoModel.fromMap(response.data);
      return visitorInfoModel;
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }
}

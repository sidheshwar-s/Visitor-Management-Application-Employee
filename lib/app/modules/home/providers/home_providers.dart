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

  Future<void>? updateRequestedMeeting(
      {required String meetingId,
      required String status,
      String? meetingNote,
      String? rejectedReason,
      String? rescheduledTime}) async {
    Map<String, String?> data = {
      "meetingId": meetingId,
      "status": status,
      "meetingMinutesNotes": meetingNote,
      "rejectedReasons": rejectedReason,
      "rescheduledTime": rescheduledTime,
    };

    const String url = "$apiUrl/meeting/updateMeetingStatus";

    try {
      await dioClient.post(url, data: data);
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }
}

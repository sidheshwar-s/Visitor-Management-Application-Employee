import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/common.dart';
import 'package:vms_employee_flutter/app/modules/meeting_request/models/meeting_request_model.dart';

class MeetingRequestProviders {
  Future<MeetingRequestModel?> getMeetingRequestDetails() async {
    const url = "$apiUrl/meeting/searchMeeting";
    try {
      Response response = await dioClient.get(url);
      MeetingRequestModel meetingRequestModel =
          MeetingRequestModel.fromMap(response.data);
      return meetingRequestModel;
    } on DioError catch (e) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((duration) => showSnackBar(title: e.message));
    } catch (e) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (duration) => showSnackBar(title: e.toString()));
    }
  }
}

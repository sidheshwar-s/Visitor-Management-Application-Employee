import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/meeting_request/models/meeting_request_model.dart';

class MeetingRequestController extends GetxController {
  MeetingRequestModel? meetingRequestModel;
  TextEditingController rejectedReasonController = TextEditingController();
}

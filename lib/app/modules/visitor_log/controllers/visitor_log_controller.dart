import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/models/visitor_log_model.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/providers/visitor_log_providers.dart';

class VisitorLogController extends GetxController with StateMixin {
  TextEditingController nameController = TextEditingController();
  VisitorLogModel? visitorLogModel;
  @override
  void onInit() {
    getVisitorsLog();
    super.onInit();
  }

  void getVisitorsLog() async {
    change(null, status: RxStatus.loading());
    visitorLogModel = await VisitorLogProviders().getVisitorsList();
    change(null, status: RxStatus.success());
  }
}

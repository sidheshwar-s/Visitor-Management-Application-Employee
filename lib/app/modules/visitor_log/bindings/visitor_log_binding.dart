import 'package:get/get.dart';

import 'package:vms_employee_flutter/app/modules/visitor_log/controllers/visitor_info_controller.dart';

import '../controllers/visitor_log_controller.dart';

class VisitorLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorInfoController>(
      () => VisitorInfoController(),
    );
    Get.lazyPut<VisitorLogController>(
      () => VisitorLogController(),
    );
  }
}

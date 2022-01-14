import 'package:get/get.dart';

import '../controllers/visitor_log_controller.dart';

class VisitorLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorLogController>(
      () => VisitorLogController(),
    );
  }
}

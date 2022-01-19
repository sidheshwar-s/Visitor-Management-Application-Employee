import 'package:get/get.dart';

import '../controllers/meeting_request_controller.dart';

class MeetingRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingRequestController>(
      () => MeetingRequestController(),
    );
  }
}

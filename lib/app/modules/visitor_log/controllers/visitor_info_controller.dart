import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/models/visitor_info_model.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/providers/visitor_log_providers.dart';

class VisitorInfoController extends GetxController with StateMixin {
  VisitorInfoModel? visitorInfo;
  getVisitorInfo(String visitorId) async {
    change(null, status: RxStatus.loading());
    visitorInfo =
        await VisitorLogProviders().getVisitorInfo(visitorId: visitorId);
    change(null, status: RxStatus.success());
  }
}

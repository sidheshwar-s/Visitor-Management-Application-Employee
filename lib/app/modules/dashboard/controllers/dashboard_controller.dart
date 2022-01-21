import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/models/dashboard_model.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/providers/dashboard_providers.dart';

class DashboardController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    getDashboardDetails();
  }

  DashBoardModel? dashBoardModel;

  getDashboardDetails() async {
    change(null, status: RxStatus.loading());
    dashBoardModel = await DashboardProviders().getDashbaordDetails();
    change(null, status: RxStatus.success());
  }
}

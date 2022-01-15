import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/home/models/home_page_model.dart';
import 'package:vms_employee_flutter/app/modules/home/providers/home_providers.dart';

class HomeController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    getHomePageDetails();
  }

  RxBool vacationMode = RxBool(false);
  HomePageModel? homePageDetails;

  void getHomePageDetails() async {
    change(null, status: RxStatus.loading());
    homePageDetails = await HomeProviders().getHomePageDetails();
    change(null, status: RxStatus.success());
  }
}

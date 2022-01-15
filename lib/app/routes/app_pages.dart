import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/auth/views/root_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/visitor_log/bindings/visitor_log_binding.dart';
import '../modules/visitor_log/views/visitor_log_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const RootView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VISITOR_LOG,
      page: () => VisitorLogView(),
      binding: VisitorLogBinding(),
    ),
  ];
}

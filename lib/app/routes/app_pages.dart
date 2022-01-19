import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/root_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/meeting_request/bindings/meeting_request_binding.dart';
import '../modules/meeting_request/views/meeting_request_view.dart';
import '../modules/visitor_log/bindings/visitor_log_binding.dart';
import '../modules/visitor_log/views/visitor_log_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MEETING_REQUEST;

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
      page: () => const VisitorLogView(),
      binding: VisitorLogBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MEETING_REQUEST,
      page: () => MeetingRequestView(),
      binding: MeetingRequestBinding(),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/home_drawer.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/request_widget.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/time_and_date_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
        drawer: HomeDrawer(authController: authController),
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: controller.obx(
          (state) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const TimeAndDateWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Requests",
                    style: Get.textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RequestWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}

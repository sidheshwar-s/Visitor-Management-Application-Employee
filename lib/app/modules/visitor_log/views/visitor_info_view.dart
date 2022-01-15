import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/controllers/visitor_info_controller.dart';

class VisitorInfoView extends GetView<VisitorInfoController> {
  const VisitorInfoView({
    Key? key,
    required this.visitorId,
  }) : super(key: key);
  final String visitorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Info'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Column(
          children: [],
        ),
      ),
    );
  }
}

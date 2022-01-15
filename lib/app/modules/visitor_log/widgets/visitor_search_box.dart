import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/controllers/visitor_log_controller.dart';

class VisitorSearchBox extends StatelessWidget {
  const VisitorSearchBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VisitorLogController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.nameController,
      decoration: InputDecoration(
        hintText: "Enter visitor name",
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.close,
            color: kGrey,
          ),
          onPressed: () => controller.nameController.clear(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/visitor_log_controller.dart';

class VisitorLogView extends GetView<VisitorLogController> {
  const VisitorLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitors Log'),
        centerTitle: true,
      ),
    );
  }
}

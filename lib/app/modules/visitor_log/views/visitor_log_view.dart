import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/visitor_log_controller.dart';

class VisitorLogView extends GetView<VisitorLogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VisitorLogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VisitorLogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

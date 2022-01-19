import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/meeting_request_controller.dart';

class MeetingRequestView extends GetView<MeetingRequestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeetingRequestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MeetingRequestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

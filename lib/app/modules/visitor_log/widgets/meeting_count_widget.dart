import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/views/visitor_meetings_view.dart';

class MeetingCountWidget extends StatelessWidget {
  const MeetingCountWidget({
    Key? key,
    required this.category,
    required this.title,
    this.meetings,
    required this.color,
  }) : super(key: key);
  final String category;
  final String title;
  final List<MeetingModel>? meetings;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => VisitorMeetingsView(
          appBarTitle: category,
          meetings: meetings,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Get.textTheme.headline5?.copyWith(
                color: kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

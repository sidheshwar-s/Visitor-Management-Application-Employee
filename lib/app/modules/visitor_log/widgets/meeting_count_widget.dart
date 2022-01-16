import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';

class MeetingCountWidget extends StatelessWidget {
  const MeetingCountWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

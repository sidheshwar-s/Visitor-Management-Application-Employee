import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/controllers/visitor_info_controller.dart';

class VisitorInfoView extends GetView<VisitorInfoController> {
  const VisitorInfoView({
    Key? key,
    required this.visitorId,
    required this.visitorName,
    this.imageUrl,
  }) : super(key: key);
  final String visitorId;
  final String visitorName;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Info'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: imageUrl != null
                    ? CircleAvatar(
                        radius: 35, backgroundImage: NetworkImage(imageUrl!))
                    : const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          'assets/icons/user_image.png',
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                visitorName,
                style: Get.textTheme.headline5?.copyWith(
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your meeting history and Updates",
                style: Get.textTheme.bodyText1,
              ),
              const SizedBox(
                height: 20,
              ),
              MeetingCountWidget(
                title:
                    "Completed Meetings  -  ${controller.visitorInfo!.completedMeetings}",
                color: kGreen,
              ),
              MeetingCountWidget(
                title:
                    "Rejected Meetings  -  ${controller.visitorInfo!.rejectedMeetings}",
                color: kRed,
              ),
              MeetingCountWidget(
                title:
                    "Rescheduled Meetings  -  ${controller.visitorInfo!.rescheduledMeetings}",
                color: kDarkBlue!,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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

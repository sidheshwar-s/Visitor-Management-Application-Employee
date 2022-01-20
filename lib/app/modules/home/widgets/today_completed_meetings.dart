import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class TodayCompleteMeetings extends StatelessWidget {
  const TodayCompleteMeetings({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.homePageDetails!.todayCompletedMeetings!.length,
      itemBuilder: (BuildContext context, int index) {
        var currentRecord =
            controller.homePageDetails!.todayCompletedMeetings![index];

        DateTime? startTime = currentRecord.meetingAcceptedTime;
        DateTime? endTime = currentRecord.meetingEndTime;
        Duration? meetingTimings;

        if (startTime != null && endTime != null) {
          meetingTimings = endTime.difference(startTime);
        }

        return TodayCompletedMeetingWidget(
          currentRecord: currentRecord,
          meetingTimings: meetingTimings,
        );
      },
    );
  }
}

class TodayCompletedMeetingWidget extends StatelessWidget {
  const TodayCompletedMeetingWidget({
    Key? key,
    required this.currentRecord,
    required this.meetingTimings,
  }) : super(key: key);

  final MeetingModel currentRecord;
  final Duration? meetingTimings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: DefaultTextStyle(
              style: Get.textTheme.headline6!.copyWith(
                color: kBlack,
                fontWeight: FontWeight.w600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Meeting with ${currentRecord.visitor?.name}",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentRecord.meetingMinutesNotes ?? '',
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: kBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Meeting Duration: ${meetingTimings?.inMinutes ?? 0} minutes",
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 20,
            decoration: BoxDecoration(
              color: kDarkBlue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          )
        ],
      ),
    );
  }
}

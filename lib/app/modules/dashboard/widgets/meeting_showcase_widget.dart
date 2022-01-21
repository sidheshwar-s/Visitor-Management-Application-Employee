import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class MeetingShowcaseWidget extends StatelessWidget {
  const MeetingShowcaseWidget({
    Key? key,
    required this.meetingDetails,
  }) : super(key: key);

  final MeetingModel? meetingDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
      ),
      child: Row(
        children: [
          if (meetingDetails?.visitor?.selfieLink != null)
            CircleAvatar(
              radius: 35,
              backgroundImage:
                  NetworkImage(meetingDetails!.visitor!.selfieLink!),
            ),
          if (meetingDetails?.visitor?.selfieLink == null)
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/icons/user_image.png',
              ),
            ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meetingDetails?.visitor?.name ?? 'No name',
                style: Get.textTheme.headline6,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Duration: ${meetingDetails?.meetingEndTime?.difference(meetingDetails!.meetingAcceptedTime!).inMinutes} minutes",
              )
            ],
          )
        ],
      ),
    );
  }
}

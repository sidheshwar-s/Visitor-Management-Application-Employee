import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/providers/home_providers.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/custom_button.dart';

class RequestWidget extends GetView<HomeController> {
  const RequestWidget({
    Key? key,
    required this.meetingId,
    this.photoUrl,
    required this.name,
  }) : super(key: key);
  final String meetingId;
  final String? photoUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 180,
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          if (photoUrl != null)
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(photoUrl!),
            ),
          if (photoUrl == null)
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/icons/user_image.png',
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "$name is here to visit you, Would you like to?",
                    style: const TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Reject",
                        color: kRed,
                        onPressed: () async {
                          controller.isUpdationInProgress.value = true;
                          await handleRejection(
                            meetingId,
                            controller.rejectedReasonController,
                            controller,
                          );
                          controller.isUpdationInProgress.value = false;
                        },
                        icon: Icons.cancel,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: "Reshedule",
                        color: kBlue,
                        onPressed: () async {
                          controller.isUpdationInProgress.value = true;
                          DatePicker.showTime12hPicker(
                            context,
                            currentTime: DateTime.now(),
                            onChanged: (date) {
                              controller.rescheduledTime = date;
                            },
                            onConfirm: (date) {
                              controller.rescheduledTime = date;
                            },
                          );
                          await HomeProviders().updateRequestedMeeting(
                            meetingId: meetingId,
                            status: "rescheduled",
                            rescheduledTime:
                                controller.rescheduledTime.toString(),
                          );
                          controller.isUpdationInProgress.value = false;
                          controller.getHomePageDetails();
                        },
                        icon: Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  key: const Key("accepting"),
                  text: "Accept",
                  color: kGreen,
                  onPressed: () async {
                    controller.isUpdationInProgress.value = true;
                    await HomeProviders().updateRequestedMeeting(
                      meetingId: meetingId,
                      status: "accepted",
                    );
                    controller.isUpdationInProgress.value = false;
                    controller.getHomePageDetails();
                  },
                  icon: Icons.done,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

handleRejection(String meetingId, TextEditingController textEditingController,
    HomeController controller,
    {bool shouldCloseApp = false, bool onTappedNotification = false}) async {
  Get.defaultDialog(
    titlePadding: const EdgeInsets.only(
      top: 15,
      bottom: 5,
    ),
    title: 'REJECT',
    titleStyle: Get.textTheme.headline6?.copyWith(color: kBlack),
    cancelTextColor: kBlack,
    confirmTextColor: kBlack,
    onCancel: () => Get.back(),
    onConfirm: () async {
      await HomeProviders()
          .updateRequestedMeeting(
        meetingId: meetingId,
        status: "rejected",
        rejectedReason: textEditingController.text,
      )
          ?.whenComplete(() {
        controller.getHomePageDetails();
        if (shouldCloseApp) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        if (onTappedNotification) {
          Get.back();
        }
      });
      Get.back();
    },
    content: Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: DefaultTextStyle(
        style: Get.textTheme.bodyText1!.copyWith(
          color: kBlack,
          fontSize: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter the reason for rejection",
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: textEditingController,
              style: const TextStyle(
                color: kBlack,
              ),
              cursorColor: kBlack,
              decoration: const InputDecoration(
                focusColor: kBlue,
                hoverColor: kBlack,
                hintText: "Rejection reason",
              ),
            )
          ],
        ),
      ),
    ),
  );
}

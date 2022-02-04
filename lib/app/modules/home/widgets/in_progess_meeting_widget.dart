import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/providers/home_providers.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/custom_button.dart';

class InProgressWidget extends GetView<HomeController> {
  const InProgressWidget({
    Key? key,
    this.name,
    this.photoUrl,
    required this.meetingId,
  }) : super(key: key);
  final String? name;
  final String? photoUrl;
  final String meetingId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
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
                    "Meeting with $name is going on",
                    style: const TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    isUpdationInProgress: controller.isUpdationInProgress,
                    text: "Mark as completed",
                    color: kGreen,
                    onPressed: () {
                      Get.defaultDialog(
                        titlePadding: const EdgeInsets.only(
                          top: 15,
                          bottom: 5,
                        ),
                        title: 'Meeting completed',
                        titleStyle:
                            Get.textTheme.headline6?.copyWith(color: kBlack),
                        cancelTextColor: kBlack,
                        confirmTextColor: kBlack,
                        onCancel: () => Get.back(),
                        onConfirm: () async {
                          controller.isUpdationInProgress.value = true;
                          await HomeProviders().updateRequestedMeeting(
                            meetingId: meetingId,
                            status: "completed",
                            meetingNote: controller.meetinNotesController.text,
                            meetingEndTime: DateTime.now().toString(),
                          );
                          controller.isUpdationInProgress.value = false;
                          Get.back();
                          controller.getHomePageDetails();
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
                                  "Enter a short note about the meeting",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: controller.meetinNotesController,
                                  style: const TextStyle(
                                    color: kBlack,
                                  ),
                                  cursorColor: kBlack,
                                  decoration: const InputDecoration(
                                    focusColor: kBlue,
                                    hoverColor: kBlack,
                                    hintText: "Meeting note",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';

import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';
import 'package:vms_employee_flutter/app/modules/home/providers/home_providers.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/request_widget.dart';
import 'package:vms_employee_flutter/app/routes/app_pages.dart';
import '../controllers/meeting_request_controller.dart';

class MeetingRequestView extends GetView<MeetingRequestController> {
  const MeetingRequestView({
    Key? key,
    this.meetingModel,
  }) : super(key: key);
  final MeetingModel? meetingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultTextStyle(
            style: Get.textTheme.headline6!.copyWith(color: kWhite),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (meetingModel?.visitor?.selfieLink == null)
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/icons/user_image.png'),
                    ),
                  if (meetingModel?.visitor?.selfieLink != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        meetingModel!.visitor!.selfieLink!,
                      ),
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    meetingModel?.visitor?.name ?? "No Name",
                    style: Get.textTheme.headline4?.copyWith(color: kWhite),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: kDarkBlue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Purpose"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          meetingModel?.purpose ?? "No purpose was mentioned",
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: kWhite,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await HomeProviders().updateRequestedMeeting(
                                meetingId: meetingModel?.id ?? 'none',
                                status: "accepted",
                              );
                              Get.offAllNamed(Routes.HOME);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kGreen,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: kWhite,
                                size: 30,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              handleRejection(
                                  meetingModel?.id ?? 'none',
                                  controller.rejectedReasonController,
                                  Get.find<HomeController>());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kRed,
                              ),
                              child: const Icon(
                                Icons.cancel,
                                color: kWhite,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

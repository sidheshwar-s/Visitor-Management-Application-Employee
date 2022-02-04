import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/providers/home_providers.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/custom_button.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/request_widget.dart';
import 'package:vms_employee_flutter/app/modules/meeting_request/models/meeting_request_model.dart';
import 'package:vms_employee_flutter/app/routes/app_pages.dart';
import '../controllers/meeting_request_controller.dart';

class MeetingRequestView extends GetView<MeetingRequestController> {
  const MeetingRequestView({
    Key? key,
    this.meetingRequestModel,
  }) : super(key: key);
  final MeetingRequestModel? meetingRequestModel;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final meetingModel = meetingRequestModel?.meeting;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: DefaultTextStyle(
              style: Get.textTheme.headline6!.copyWith(color: kWhite),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
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
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            isUpdationInProgress:
                                homeController.isRejectionInProgress,
                            text: "Reject",
                            color: kRed,
                            onPressed: () async {
                              homeController.isRejectionInProgress.value = true;
                              await handleRejection(
                                meetingModel?.id ?? 'none',
                                homeController.rejectedReasonController,
                                homeController,
                              );
                              homeController.isRejectionInProgress.value =
                                  false;
                              Get.offAllNamed(Routes.HOME);
                            },
                            icon: Icons.cancel,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomButton(
                            isUpdationInProgress:
                                homeController.isRescheduleInProgress,
                            text: "Reshedule",
                            color: kBlue,
                            onPressed: () async {
                              await DatePicker.showTime12hPicker(
                                context,
                                currentTime: DateTime.now(),
                                onChanged: (date) {
                                  homeController.rescheduledTime = date;
                                },
                                onConfirm: (date) {
                                  homeController.rescheduledTime = date;
                                },
                              );
                              homeController.isRescheduleInProgress.value =
                                  true;
                              await HomeProviders().updateRequestedMeeting(
                                meetingId: meetingModel?.id ?? 'none',
                                status: "reschedule",
                                rescheduledTime: homeController
                                    .rescheduledTime?.millisecondsSinceEpoch
                                    .toString(),
                              );
                              homeController.isRescheduleInProgress.value =
                                  false;
                              homeController.getHomePageDetails();
                              Get.offAllNamed(Routes.HOME);
                            },
                            icon: Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      isUpdationInProgress:
                          homeController.isAcceptingInProgress,
                      key: const Key("accepting"),
                      text: "Accept",
                      color: kGreen,
                      onPressed: () async {
                        homeController.isAcceptingInProgress.value = true;
                        await HomeProviders().updateRequestedMeeting(
                          meetingId: meetingModel?.id ?? 'none',
                          status: "accepted",
                        );
                        homeController.isAcceptingInProgress.value = false;
                        homeController.getHomePageDetails();
                        Get.offAllNamed(Routes.HOME);
                      },
                      icon: Icons.done,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

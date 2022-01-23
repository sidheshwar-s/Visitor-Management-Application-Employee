import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

class VisitorMeetingsView extends GetView {
  const VisitorMeetingsView({
    Key? key,
    this.meetings,
    required this.appBarTitle,
  }) : super(key: key);
  final List<MeetingModel>? meetings;
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: meetings!.isEmpty
            ? const Center(
                child: Text("No records"),
              )
            : ListView.builder(
                itemCount: meetings?.length ?? 0,
                itemBuilder: (context, index) {
                  final currentMeeting = meetings?[index];
                  if (currentMeeting == null) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        currentMeeting.visitor?.selfieLink != null
                            ? CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  currentMeeting.visitor!.selfieLink!,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/icons/user_image.png'),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentMeeting.visitor?.name ?? 'No name',
                                style: Get.textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              if (appBarTitle == "Completed Meetings")
                                Row(
                                  children: [
                                    const Text(
                                      "MOM:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(currentMeeting.meetingMinutesNotes ??
                                        'No MOM'),
                                  ],
                                ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                DateFormat.yMEd().add_jms().format(
                                      currentMeeting.meetingRequestTime!,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

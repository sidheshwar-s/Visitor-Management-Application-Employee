import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/models/dashboard_model.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/models/most_visited_visitor_model.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/widgets/meeting_pie_chart.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/widgets/meeting_showcase_widget.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/widgets/most_visited_visitor_widget.dart';
import 'package:vms_employee_flutter/app/modules/home/models/meeting_model.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          DashBoardModel? dashBoardModel = controller.dashBoardModel;
          if (dashBoardModel == null) {
            return const Center(
              child: Text("No data found"),
            );
          }
          MostVisitedVisitorModel? mostVisitedVisitorModel =
              dashBoardModel.mostVisitedVisitor;
          String? photoUrl = mostVisitedVisitorModel?.selfieLink;

          MeetingModel? longestMeeting = dashBoardModel.longestMeeting;
          MeetingModel? shortestMeeting = dashBoardModel.shortestMeeting;
          Map<String, double> dataMap = {
            "Rescheduled": dashBoardModel.rescheduled?.toDouble() ?? 0,
            "In Progress": dashBoardModel.inProgress?.toDouble() ?? 0,
            "Rejected": dashBoardModel.rejected?.toDouble() ?? 0,
            "Completed": dashBoardModel.completed?.toDouble() ?? 0,
          };
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your meetings",
                    style: Get.textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MeetingPieChart(dataMap: dataMap),
                  const SizedBox(
                    height: 20,
                  ),
                  if (mostVisitedVisitorModel?.visitorName != null)
                    Text(
                      "Most Visited Visitor",
                      style: Get.textTheme.headline5,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (mostVisitedVisitorModel?.visitorName != null)
                    MostVisitedVisitorWidget(
                      photoUrl: photoUrl,
                      mostVisitedVisitorModel: mostVisitedVisitorModel,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (longestMeeting != null)
                    Text(
                      "Longest Meeting",
                      style: Get.textTheme.headline5,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (longestMeeting != null)
                    MeetingShowcaseWidget(meetingDetails: longestMeeting),
                  const SizedBox(
                    height: 20,
                  ),
                  if (shortestMeeting != null)
                    Text(
                      "Shortest Meeting",
                      style: Get.textTheme.headline5,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (shortestMeeting != null)
                    MeetingShowcaseWidget(meetingDetails: shortestMeeting),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/home_drawer.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/in_progess_meeting_widget.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/request_widget.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/time_and_date_widget.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/today_completed_meetings.dart';
import 'package:vms_employee_flutter/main.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final controller = Get.find<HomeController>();
    return Scaffold(
        drawer: HomeDrawer(authController: authController),
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: controller.obx(
          (state) => RefreshIndicator(
            color: kDarkBlue,
            onRefresh: () async {
              controller.getHomePageDetails();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Get.size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const TimeAndDateWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      if (controller
                          .homePageDetails!.requestMeetings!.isNotEmpty)
                        Text(
                          "Requests",
                          style: Get.textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (controller
                          .homePageDetails!.requestMeetings!.isNotEmpty)
                        const SizedBox(
                          height: 10,
                        ),
                      if (controller
                          .homePageDetails!.requestMeetings!.isNotEmpty)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                              .homePageDetails!.requestMeetings!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var currentVisitor = controller.homePageDetails!
                                .requestMeetings![index].visitor;
                            return RequestWidget(
                              meetingId: controller
                                  .homePageDetails!.requestMeetings![index].id!,
                              name: currentVisitor!.name!,
                              photoUrl: currentVisitor.selfieLink,
                            );
                          },
                        ),
                      if (controller
                          .homePageDetails!.inProgressMeetings!.isNotEmpty)
                        Text(
                          "In Progess Meetings",
                          style: Get.textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (controller
                          .homePageDetails!.inProgressMeetings!.isNotEmpty)
                        const SizedBox(
                          height: 10,
                        ),
                      if (controller
                          .homePageDetails!.inProgressMeetings!.isNotEmpty)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                              .homePageDetails!.inProgressMeetings!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var currentVisitor = controller.homePageDetails!
                                .inProgressMeetings![index].visitor;
                            return InProgressWidget(
                              meetingId: controller.homePageDetails!
                                  .inProgressMeetings![index].id!,
                              name: currentVisitor!.name!,
                              photoUrl: currentVisitor.selfieLink,
                            );
                          },
                        ),
                      if (controller
                          .homePageDetails!.todayCompletedMeetings!.isNotEmpty)
                        Text(
                          "Today Completed Meetings",
                          style: Get.textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (controller
                          .homePageDetails!.todayCompletedMeetings!.isNotEmpty)
                        const SizedBox(
                          height: 10,
                        ),
                      if (controller
                          .homePageDetails!.todayCompletedMeetings!.isNotEmpty)
                        TodayCompleteMeetings(
                          controller: controller,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/controllers/visitor_info_controller.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/views/visitor_info_view.dart';
import 'package:vms_employee_flutter/app/modules/visitor_log/widgets/visitor_search_box.dart';
import '../controllers/visitor_log_controller.dart';

class VisitorLogView extends GetView<VisitorLogController> {
  const VisitorLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitors Log'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: DefaultTextStyle(
            style: Get.textTheme.headline6!.copyWith(color: kWhite),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search by visitor name",
                    style: Get.textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  VisitorSearchBox(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.visitorLogModel!.visitors.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentVisitor =
                          controller.visitorLogModel!.visitors[index];

                      return Obx(
                        () {
                          if (currentVisitor.name!
                              .toLowerCase()
                              .contains(controller.searchString.value)) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                Get.lazyPut<VisitorInfoController>(
                                  () => VisitorInfoController(),
                                );
                                Get.find<VisitorInfoController>()
                                    .getVisitorInfo(currentVisitor.id!);
                                Get.to(
                                  () => VisitorInfoView(
                                    visitorId: currentVisitor.id!,
                                    visitorName: currentVisitor.name!,
                                    imageUrl: currentVisitor.selfieLink,
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 80,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kDarkBlue,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    currentVisitor.selfieLink != null
                                        ? CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                currentVisitor.selfieLink!),
                                          )
                                        : const CircleAvatar(
                                            radius: 35,
                                            backgroundImage: AssetImage(
                                                'assets/icons/user_image.png'),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentVisitor.name ?? "No name",
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            currentVisitor.companyName ??
                                                "No company name",
                                            style: Get.textTheme.bodyText1
                                                ?.copyWith(
                                              color: kWhite,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: kWhite,
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

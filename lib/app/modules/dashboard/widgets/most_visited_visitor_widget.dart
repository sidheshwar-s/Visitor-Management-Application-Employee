import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/dashboard/models/most_visited_visitor_model.dart';

class MostVisitedVisitorWidget extends StatelessWidget {
  const MostVisitedVisitorWidget({
    Key? key,
    required this.photoUrl,
    required this.mostVisitedVisitorModel,
  }) : super(key: key);

  final String? photoUrl;
  final MostVisitedVisitorModel? mostVisitedVisitorModel;

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
            width: 20,
          ),
          Text(
            mostVisitedVisitorModel?.visitorName ?? 'No name',
            style: Get.textTheme.headline6,
          )
        ],
      ),
    );
  }
}

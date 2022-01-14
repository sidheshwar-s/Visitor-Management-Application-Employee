import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';

class TimeAndDateWidget extends StatelessWidget {
  const TimeAndDateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: KDarkBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/calendar.png',
            height: 100,
          ),
          const SizedBox(
            width: 20,
          ),
          StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    style: Get.textTheme.headline6?.copyWith(
                      color: kWhite,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateFormat.jms().format(DateTime.now()),
                    style: Get.textTheme.headline6?.copyWith(
                      color: kWhite,
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

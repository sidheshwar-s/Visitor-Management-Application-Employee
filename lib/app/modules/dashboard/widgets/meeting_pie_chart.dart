import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';

class MeetingPieChart extends StatelessWidget {
  const MeetingPieChart({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
      ),
      child: PieChart(
        dataMap: dataMap,
      ),
    );
  }
}

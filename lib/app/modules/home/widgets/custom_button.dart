import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.icon,
    this.radius = 20,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final IconData icon;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: kWhite,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';

class CustomButton extends GetView<HomeController> {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.icon,
    this.radius = 20,
    required this.isUpdationInProgress,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final IconData icon;
  final double? radius;
  final RxBool isUpdationInProgress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius!),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: color,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: Get.textTheme.bodyText1?.copyWith(
                  color: kWhite,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (!isUpdationInProgress.value)
                Icon(
                  icon,
                  color: kWhite,
                ),
              if (isUpdationInProgress.value)
                const SizedBox(
                  height: 10,
                  width: 10,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kWhite,
                      strokeWidth: 2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

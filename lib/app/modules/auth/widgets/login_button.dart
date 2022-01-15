import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';

class LoginButton extends GetView<AuthController> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: FloatingActionButton.extended(
          onPressed: () {
            controller.signInWithEmail();
          },
          label: Row(
            children: [
              Text(
                "Login",
                style: Get.textTheme.headline6?.copyWith(
                  color: kWhite,
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: kWhite,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            "Login",
            style: Get.textTheme.headline6?.copyWith(
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}

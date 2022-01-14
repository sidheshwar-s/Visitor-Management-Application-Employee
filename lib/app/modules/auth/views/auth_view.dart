import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/widgets/email_text_field.dart';
import 'package:vms_employee_flutter/app/modules/auth/widgets/login_button.dart';
import 'package:vms_employee_flutter/app/modules/auth/widgets/password_text_field.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/vms_logo.png',
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Login",
                      style: Get.textTheme.headline4?.copyWith(color: kWhite),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(" Enter the details below to continue "),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EmailTextField(controller: controller),
                  PasswordTextField(controller: controller),
                  const LoginButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: TextField(
        obscureText: true,
        style: const TextStyle(color: kWhite),
        controller: controller.passwordController,
        decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(Icons.lock),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
      ),
    );
  }
}

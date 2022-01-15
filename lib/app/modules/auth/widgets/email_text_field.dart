import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        style: const TextStyle(color: kWhite),
        controller: controller.emailController,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(Icons.mail),
          suffixIcon: controller.emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: kGrey,
                  ),
                  onPressed: () => controller.emailController.clear(),
                ),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
      ),
    );
  }
}

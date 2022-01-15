import 'package:flutter/material.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/home/widgets/custom_button.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/icons/user_image.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  child: Text(
                    "Employee Paul is here to visit you, Would you like to?",
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Reject",
                        color: kRed,
                        onPressed: () {},
                        icon: Icons.cancel,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: "Reshedule",
                        color: kBlue,
                        onPressed: () {},
                        icon: Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: "Accept",
                  color: kGreen,
                  onPressed: () {},
                  icon: Icons.done,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

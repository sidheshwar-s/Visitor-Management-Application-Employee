import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vms_employee_flutter/app/data/constants.dart';
import 'package:vms_employee_flutter/app/modules/auth/controllers/auth_controller.dart';
import 'package:vms_employee_flutter/app/modules/home/controllers/home_controller.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: KDarkBlue,
      child: ListView(
        children: [
          EmployeeInfo(authController: authController),
          const Divider(
            color: kWhite,
          ),
          const HomeListTile(),
          const DashboardListTile(),
          const VisitorLogListTile(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: kWhite,
          ),
          VacationModeListTile(controller: controller),
          LogoutButtonListTile(
            controller: authController,
          ),
        ],
      ),
    );
  }
}

class EmployeeInfo extends StatelessWidget {
  const EmployeeInfo({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          authController.photoUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    authController.photoUrl!,
                  ),
                  radius: 40,
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/icons/user_image.png',
                  ),
                  radius: 40,
                ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                authController.userName ?? "No name",
                style: Get.textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(authController.email ?? "email")
            ],
          )
        ],
      ),
    );
  }
}

class LogoutButtonListTile extends StatelessWidget {
  const LogoutButtonListTile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        onTap: () => controller.signOut(),
        leading: const Icon(
          Icons.logout,
          color: kWhite,
        ),
        title: const Text("Log out"),
        style: ListTileStyle.drawer,
      ),
    );
  }
}

class VacationModeListTile extends StatelessWidget {
  const VacationModeListTile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Obx(
        () => Switch(
          value: controller.vacationMode.value,
          activeColor: kRed,
          inactiveThumbColor: kWhite,
          onChanged: (bool val) {
            controller.vacationMode.value = val;
          },
        ),
      ),
      title: const Text("Vacation Mode"),
    );
  }
}

class VisitorLogListTile extends StatelessWidget {
  const VisitorLogListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.workspaces_outline,
          color: kWhite,
        ),
        title: const Text("Visitor log"),
        style: ListTileStyle.drawer,
      ),
    );
  }
}

class DashboardListTile extends StatelessWidget {
  const DashboardListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.dashboard,
          color: kWhite,
        ),
        title: const Text("Dashboard"),
        style: ListTileStyle.drawer,
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.home,
          color: kWhite,
        ),
        title: const Text("Home"),
        style: ListTileStyle.drawer,
      ),
    );
  }
}

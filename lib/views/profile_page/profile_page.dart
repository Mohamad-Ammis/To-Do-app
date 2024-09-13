import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/profile_page_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/controllers/theme_controller.dart';
import 'package:to_do_app/views/badget_page/badget_page.dart';
import 'package:to_do_app/views/profile_page/widgets/custom_profile_list_tile.dart';
import 'package:to_do_app/views/profile_page/widgets/image_tasks_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final themeController = Get.find<ThemeController>();

  final controller = Get.put(ProfilePageController());
  final TaskController taskController = Get.put(TaskController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.toDoTaskCount = taskController.getToDoTasks().length;
    controller.completedTaskCount = taskController.getCompletedTasks().length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ImageAndTasksSection(),
              CustomProfileListTile(
                icon: FontAwesomeIcons.trophy,
                title: 'Badgets',
                onTap: () {
                  Get.to(() => BadgetsPage(
                        completedTaskCount: 5,
                      ));
                },
              ),
              CustomProfileListTile(
                icon: Icons.notifications,
                title: 'Notifications',
                trailing: Obx(() => Switch(
                      inactiveTrackColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Colors.red,
                      activeTrackColor: Colors.red,
                      activeColor: Colors.white,
                      value: controller.notificationsEnabled.value,
                      onChanged: (bool value) {
                        controller.toggleNotifications(value);
                      },
                    )),
              ),
              CustomProfileListTile(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Obx(() => Switch(
                      inactiveTrackColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Colors.blue,
                      activeTrackColor: Colors.blue,
                      activeColor: Colors.white,
                      value: themeController.isDarkMode.value,
                      onChanged: (bool value) {
                        themeController.toggleTheme(value);
                      },
                    )),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              const CustomProfileListTile(
                icon: Icons.info,
                title: 'About US',
              ),
              const CustomProfileListTile(
                icon: Icons.question_answer,
                title: 'FAQ',
              ),
              const CustomProfileListTile(
                icon: Icons.support_agent,
                title: 'Support US',
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title:
                    const Text('Log out', style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

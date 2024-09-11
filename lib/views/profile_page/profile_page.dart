import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/profile_page_controller.dart';
import 'package:to_do_app/views/badget_page/badget_page.dart';
import 'package:to_do_app/views/profile_page/widgets/custom_profile_list_tile.dart';
import 'package:to_do_app/views/profile_page/widgets/image_tasks_section.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ImageAndTasksSection(),
              // const CustomProfileListTile(
              //   icon: Icons.settings,
              //   title: 'App Settings',
              // ),

              CustomProfileListTile(
                icon: FontAwesomeIcons.trophy,
                title: 'Badgets',
                onTap: () {
                  Get.to(() => BadgetsPage(
                        completedTaskCount: controller.completedTaskCount,
                      ));
                },
              ),

              CustomProfileListTile(
                icon: Icons.notifications,
                title: 'Notifications',
                trailing: Obx(() => Switch(
                      inactiveTrackColor: Constans.kCardBackgroundColor,
                      inactiveThumbColor: Colors.red,
                      activeTrackColor: Colors.red,
                      value: controller.notificationsEnabled.value,
                      onChanged: (bool value) {
                        controller.toggleNotifications(value);
                      },
                    )),
              ),
              // ListTile(
              //   leading: const Icon(Icons.notifications),
              //   title: const Text(
              //     'Enable Notifications',
              //     style: TextStyle(
              //         color: Constans.kWhiteElementColor,
              //         fontFamily: Constans.kFontFamily),
              //   ),
              //   trailing: Obx(() => Switch(
              //         activeColor: Colors.blue,
              //         value: controller.notificationsEnabled.value,
              //         onChanged: (bool value) {
              //           controller.toggleNotifications(value);
              //         },
              //       )),
              // ),
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

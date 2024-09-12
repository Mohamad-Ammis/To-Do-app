import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/views/edit_note_page/edit_task_page.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';
import 'package:lottie/lottie.dart';

class TasksListView extends StatelessWidget {
  TasksListView({
    super.key,
  });
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return controller.displayTasksList.isEmpty
              ? Column(
                  children: [
                    Lottie.asset('assets/lottie/empty_tasks.json', width: 200),
                    Text(
                      'Sorry , there is no tasks in this category',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: Constans.kFontFamily),
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: controller.displayTasksList.length + 1,
                  itemBuilder: (context, index) {
                    if (controller.displayTasksList.isEmpty) {
                      log('messageasdjkalsdjaksldsjkdsdadsl');
                    }
                    return index == controller.displayTasksList.length
                        ? SizedBox(
                            height: 100,
                          )
                        : GestureDetector(
                            onTap: () {
                              homePageController
                                  .filtersList[homePageController.selectedIndex]
                                  .onTap();
                              Get.to(() => EditTaskPage(
                                    model: controller.displayTasksList[index],
                                  ));
                            },
                            child: TaskCard(
                              model: controller.displayTasksList[index],
                            ),
                          );
                  });
        });
  }
}

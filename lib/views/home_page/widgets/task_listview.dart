import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/views/edit_note_page/edit_task_page.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';
import 'package:lottie/lottie.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({
    super.key,
  });

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('init**********************************************************');
    log(homePageController.filtersList[homePageController.selectedIndex].title);
    homePageController.filtersList[homePageController.selectedIndex].onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          for (var i = 0; i < controller.displayTasksList.length; i++) {
            log(controller.displayTasksList[i].title);
          }
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
              : FutureBuilder(
                  future: Future.delayed(Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: controller.displayTasksList.length + 1,
                        itemBuilder: (context, index) {
                          if (controller.displayTasksList.isEmpty) {
                            log('messageasdjkalsdjaksldsjkdsdadsl');
                          }
                          return index == controller.displayTasksList.length
                              ? const SizedBox(
                                  height: 100,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    homePageController.filtersList[
                                            homePageController.selectedIndex]
                                        .onTap();
                                    Get.to(() => EditTaskPage(
                                          model: controller
                                              .displayTasksList[index],
                                        ));
                                  },
                                  child: TaskCard(
                                    model: controller.displayTasksList[index],
                                  ),
                                );
                        });
                  });
        });
  }
}
